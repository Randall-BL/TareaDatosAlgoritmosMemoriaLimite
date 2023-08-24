#include <iostream>
#include <vector>
#include <fstream>
#include <algorithm>
#include <iterator>
#include <sstream>
#include <cstring> // para std::remove

const int PAGE_SIZE = 256;


class PagedArray {
    std::vector<int> pages[6];
    int loadedPages[6];
    bool dirtyPages[6] = {false};  // Almacena si una página ha sido modificada
    std::fstream file;

    unsigned long long accessCounter = 0;
    unsigned long long lastAccessed[6] = {0};

    int findLRUPage() {
        int oldestPage = 0;
        for (int i = 1; i < 6; i++) {
            if (lastAccessed[i] < lastAccessed[oldestPage]) {
                oldestPage = i;
            }
        }
        return oldestPage;
    }

    void savePageToDisk(int pageIndex) {
        if (dirtyPages[pageIndex]) {
            file.seekp(loadedPages[pageIndex] * PAGE_SIZE * sizeof(int), file.beg);
            file.write(reinterpret_cast<char*>(pages[pageIndex].data()), PAGE_SIZE * sizeof(int));
            dirtyPages[pageIndex] = false;
        }
    }

public:
    PagedArray(const std::string& filename) {
        for (int i = 0; i < 6; i++) {
            loadedPages[i] = -1;
            pages[i].resize(PAGE_SIZE, 0);
        }
        file.open(filename, std::ios::in | std::ios::out | std::ios::binary);
        if (!file.is_open()) {
            std::cerr << "No se pudo abrir el archivo: " << filename << std::endl;
            exit(EXIT_FAILURE);
        }
    }

    ~PagedArray() {
        // Antes de cerrar, asegurarse de guardar cualquier página modificada
        for (int i = 0; i < 6; i++) {
            savePageToDisk(i);
        }
        file.close();
    }

    int& operator[](int index) {
        int page = index / PAGE_SIZE;
        int offset = index % PAGE_SIZE;

        for (int i = 0; i < 6; i++) {
            if (loadedPages[i] == page) {
                lastAccessed[i] = accessCounter++;
                return pages[i][offset];
            }
        }

        int replacePage = findLRUPage();
        
        // Guardar la página en disco si está "sucia"
        savePageToDisk(replacePage);

        // Cargar la nueva página en memoria
        loadedPages[replacePage] = page;
        lastAccessed[replacePage] = accessCounter++;

        file.seekg(page * PAGE_SIZE * sizeof(int), file.beg);
        file.read(reinterpret_cast<char*>(pages[replacePage].data()), PAGE_SIZE * sizeof(int));

        return pages[replacePage][offset];
    }

    void markPageDirty(int index) {
        int page = index / PAGE_SIZE;
        for (int i = 0; i < 6; i++) {
            if (loadedPages[i] == page) {
                dirtyPages[i] = true;
                break;
            }
        }
    }

    void writeToFile(int totalNumbers) {
        for (int i = 0; i < totalNumbers; ++i) {
            int value = (*this)[i];
            file.seekp(i * sizeof(int));
            file.write(reinterpret_cast<char*>(&value), sizeof(int));
        }
    }
};

void convertToBinary(const std::string& inputFile, const std::string& binaryFile) {
    std::ifstream in(inputFile);
    std::ofstream out(binaryFile, std::ios::binary | std::ios::trunc);
    int number;

    while (in >> number) {
        out.write(reinterpret_cast<char*>(&number), sizeof(int));
        if (in.peek() == ',') {
            in.ignore();
        }
    }

    in.close();
    out.close();
}

void convertToText(const std::string& binaryFile, const std::string& textFile) {
    std::ifstream in(binaryFile, std::ios::binary);
    std::ofstream out(textFile, std::ios::trunc);
    int number;

    bool first = true;
    while (in.read(reinterpret_cast<char*>(&number), sizeof(int))) {
        if (!first) {
            out << ",";
        } else {
            first = false;
        }
        out << number;
    }

    in.close();
    out.close();
}

int getTotalNumbersInFile(const std::string& filename) {
    std::ifstream file(filename, std::ios::binary | std::ios::ate);

    if (!file.is_open()) {
        std::cerr << "No se pudo abrir el archivo para lectura: " << filename << std::endl;
        exit(EXIT_FAILURE);
    }

    int count = static_cast<int>(file.tellg()) / sizeof(int);
    file.close();
    return count; 
}


int partition(PagedArray &arr, int low, int high) {
    int pivot = arr[high];
    int i = (low - 1);
    
    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            std::swap(arr[i], arr[j]);
            arr.markPageDirty(i);
            arr.markPageDirty(j);
        }
    }
    std::swap(arr[i + 1], arr[high]);
    arr.markPageDirty(i + 1);
    arr.markPageDirty(high);
    return (i + 1);
}

void quickSort(PagedArray &arr, int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}





void insertionSort(PagedArray& arr, int n) {
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            
            // Marcar página como "sucia" después de la escritura
            arr.markPageDirty(j + 1);
            
            j = j - 1;
        }
        arr[j + 1] = key;
        
        // Marcar página como "sucia" después de la escritura
        arr.markPageDirty(j + 1);
    }
}


void selectionSort(PagedArray& arr, int n) {
    for (int i = 0; i < n-1; i++) {
        int min_idx = i;
        for (int j = i+1; j < n; j++) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }
        std::swap(arr[min_idx], arr[i]);

        // Marcar páginas como "sucias" después del intercambio
        arr.markPageDirty(min_idx);
        arr.markPageDirty(i);
    }
}


void bubbleSort(PagedArray& arr, int n) {
    for (int i = 0; i < n-1; i++) {
        for (int j = 0; j < n-i-1; j++) {
            if (arr[j] > arr[j+1]) {
                std::swap(arr[j], arr[j+1]);

                // Marcar páginas como "sucias" después del intercambio
                arr.markPageDirty(j);
                arr.markPageDirty(j+1);
            }
        }
    }
}

int main(int argc, char* argv[]) {
    if (argc != 7) {
        std::cerr << "Uso incorrecto. La sintaxis correcta es:\n";
        std::cerr << "paged-sort -i <archivo> -a {QS|IS|SS|PS} -o <archivo_resultado>\n";
        return EXIT_FAILURE;
    }

    std::string inputFile, outputFile, algorithm;

    for (int i = 1; i < argc; i += 2) {
        if (std::string(argv[i]) == "-i") {
            inputFile = argv[i + 1];
        } else if (std::string(argv[i]) == "-o") {
            outputFile = argv[i + 1];
        } else if (std::string(argv[i]) == "-a") {
            algorithm = argv[i + 1];
        } else {
            std::cerr << "Argumento no reconocido: " << argv[i] << "\n";
            return EXIT_FAILURE;
        }
    }

    if (inputFile.empty() || outputFile.empty() || algorithm.empty()) {
        std::cerr << "Error en los argumentos proporcionados.\n";
        return EXIT_FAILURE;
    }

    std::string binaryFile = "temp_binary_file.bin";

    // Convertir el archivo de entrada a binario
    convertToBinary(inputFile, binaryFile);    { 


    PagedArray array(binaryFile);
    int totalNumbers = getTotalNumbersInFile(binaryFile);

    // Algoritmos de ordenamiento...
    if (algorithm == "QS") {
        quickSort(array, 0, totalNumbers - 1);
        array.writeToFile(totalNumbers);
    } else if (algorithm == "IS") {
        insertionSort(array, totalNumbers);
        array.writeToFile(totalNumbers);
    } else if (algorithm == "SS") {
        selectionSort(array, totalNumbers);
        array.writeToFile(totalNumbers);
    } else if (algorithm == "PS") {
        bubbleSort(array, totalNumbers);
        array.writeToFile(totalNumbers);
    } else {
        std::cerr << "Algoritmo no reconocido: " << algorithm << "\n";
        return EXIT_FAILURE;
    }

    // Convertir el archivo binario de salida a texto
    convertToText(binaryFile, outputFile);
    }

    // Eliminar el archivo binario temporal
    std::remove(binaryFile.c_str());


    std::cout << "Archivo " << inputFile << " ordenado usando " << algorithm 
              << " y guardado en " << outputFile << ".\n";

    return 0;
}

