
int findLRUPage();
void savePageToDisk(int pageIndex);
void markPageDirty(int index);
void writeToFile(int totalNumbers);
void convertToBinary(const std::string& inputFile, const std::string& binaryFile);
void convertToText(const std::string& binaryFile, const std::string& textFile);
int getTotalNumbersInFile(const std::string& filename);