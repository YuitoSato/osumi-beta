pragma solidity ^0.4.23;

contract OsumiQAService {

    Question[] questions;
    Answer[] answers;

//    mapping(uint => Question) questions;
//    mapping(uint => Answer) answers;
    mapping(address => uint[]) ownerIdToQuestionIds;

    struct Question {
        uint questionId;
        address owner;
        string text;
    }

    struct Answer {
        uint answerId;
        address owner;
        uint questionId;
        string text;
    }

    function createQuestion(string _text) public {
        // このuuidがちゃんと入っていない疑惑。
        uint questionId = uint(keccak256(abi.encodePacked(msg.sender, blockhash(block.number - 1))));
//        questions[questionId] = Question(msg.sender, _text);
        ownerIdToQuestionIds[msg.sender].push(4);
        questions.push(Question(4, msg.sender, _text));
    }
//
//    function createAnswer(string _text, uint questionId) public {
//        uint answerId = uint(keccak256(abi.encodePacked(msg.sender, blockhash(block.number - 1))));
//        answers[answerId] = Answer(msg.sender, questionId, _text);
//    }

    function getQuestionIdsByOwnerId() public view returns (uint[]) {
        return ownerIdToQuestionIds[msg.sender];
    }

    function getQuestionText(uint _questionId) public view returns (string) {
        for (uint i = 0; i < questions.length; i++) {
            Question question = questions[i];
            if (question.questionId == _questionId) {
                return question.text;
            }
        }
    }
//
//    function returnArray() external view returns(int8[2]) {
//        return [int8(1), 2];
//    }
//
//    function returnUints() external view returns(uint[2]) {
//        return [uint(1), 2];
//    }
//
//    function uints() external view returns(uint[]) {
//        uint[] memory result = new uint[](2);
//        for (uint i = 0; i < [1,2].length; i++) {
//            result[i] = i;
//        }
//        return result;
//    }

//    function returnArray() public pure returns(int8[], uint8[]) {
//        int8[2] storage intArr = [int(1), 2];
//        uint8[2] storage uintArr = [3, 4];
//
//        return (
//            intArr,
//            uintArr
//        );
//    }
//
//    function getAnswers() public view returns () {
//        r = new string[]();
//        for (uint i = 0; i < r.length; i++) {
//            r[i] = "a";
//        }
//    }

    // apiの調査をする

}
