#include <gtest/gtest.h>
#include "pagesort.h"
#include <iostream>
#include <fstream>


// Test para convertToBinary
TEST(PagedSortTest, ConvertToBinaryTest) {
    std::string testInputFile = "test_input.txt";
    std::string testBinaryFile = "test_binary.bin";

    // Escribir algunos datos en test_input.txt
    std::ofstream out(testInputFile);
    out << "1,2,3,4,5";
    out.close();

    // Llamada a la función
    convertToBinary(testInputFile, testBinaryFile);

    // Leer el archivo binario y verificar su contenido
    std::ifstream in(testBinaryFile, std::ios::binary);
    int number;
    std::vector<int> numbers;
    while (in.read(reinterpret_cast<char*>(&number), sizeof(int))) {
        numbers.push_back(number);
    }

    ASSERT_EQ(numbers, std::vector<int>({ 1,2,3,4,5 }));

    // Limpiar archivos de prueba
    std::remove(testInputFile.c_str());
    std::remove(testBinaryFile.c_str());
}

