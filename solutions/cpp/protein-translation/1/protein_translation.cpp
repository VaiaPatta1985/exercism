#include "protein_translation.h"

namespace protein_translation {

vector<string> proteins(string codons) {
    vector<string> result = {};
    string protein, codon;
    int position = 0;
    const int num_of_acids = codons.length();

    if (num_of_acids){
        while (position <= num_of_acids - 3) {
            codon = codons.substr(position, 3);
            protein = "";
            if (!(codon.compare("AUG"))) {
                protein = "Methionine";
            }
            if (!(codon.compare("UUU") && codon.compare("UUC"))) {
                protein = "Phenylalanine";
            }
            if (!(codon.compare("UUA") && codon.compare("UUG"))) {
                protein = "Leucine";
            }
            if (!(codon.compare("UCU") && codon.compare("UCC") && codon.compare("UCA") && codon.compare("UCG"))) {
                protein = "Serine";
            }
            if (!(codon.compare("UAU") && codon.compare("UAC"))) {
                protein = "Tyrosine";
            }
            if (!(codon.compare("UGU") && codon.compare("UGC"))) {
                protein = "Cysteine";
            }
            if (!(codon.compare("UGG"))) {
                protein = "Tryptophan";
            }
            if (!(codon.compare("UAA") && codon.compare("UAG") && codon.compare("UGA"))) {
                protein = "STOP";
                break;
            }
            if (!(protein.compare(""))) {
                //throw exception?
            }
            result.push_back(protein);
            position += 3;
        }
        if (protein.compare("STOP") && position < num_of_acids){
            //throw exception?
        }
    }
    return result;
}

}  // namespace protein_translation
