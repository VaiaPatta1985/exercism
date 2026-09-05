#include "protein_translation.h"

namespace protein_translation {

std::vector<std::string> proteins(std::string codons) {
    std::vector<std::string> result = {};
    std::string protein;
    auto position = 0;
    const int num_of_acids = codons.length();

    if (num_of_acids > 0) {
        while (position <= num_of_acids - 3) {
            auto codon = codons.substr(position, 3);
            protein = codons_to_proteins.at(codon);
            if (protein == "STOP") {
                break;
            }
            result.push_back(protein);
            position += 3;
        }
        if (protein != "STOP" && position < num_of_acids){
            throw (std::domain_error(""));
        }
    }
    return result;
}

}  // namespace protein_translation
