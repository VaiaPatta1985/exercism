#include <array>
#include <string>
#include <vector>

const int passing_grade = 40;
const int total_points = 100;

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    auto num_of_exams = student_scores.size();
    std::vector<int> result;

    for(long unsigned exam = 0; exam < num_of_exams; exam++){
        result.emplace_back((int) student_scores[exam]);
    }
    return result;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    auto num_of_exams = student_scores.size();
    auto failed = 0;

    for(long unsigned student = 0; student < num_of_exams; student++){
        if (student_scores[student] <= passing_grade) {
            failed++;
        }
    }
    return failed;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
        std::array<int, 4> result;
        auto increment = (highest_score - passing_grade) / 4;
        result[0] = passing_grade + 1;
        for(auto threshold = 1; threshold < 4; threshold++){
            result[threshold] = result[threshold - 1] + increment;
        }
    return result;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names) {
    std::vector<std::string> result;
    auto num_of_students = student_names.size();
    for(long unsigned idx=0; idx < num_of_students; idx++){
        result.emplace_back(std::to_string(idx + 1) + ". " +
                            student_names[idx] + ": " +
                            std::to_string(student_scores[idx]));
    }
    return result;
}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names) {
    auto num_of_students = student_names.size();
    for(long unsigned idx=0; idx < num_of_students; idx++){
        if (student_scores[idx] == total_points) {
            return student_names[idx];
        }
    }
    return "";
}
