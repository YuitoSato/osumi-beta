pragma solidity ^0.4.23;

contract OsumiQAService {

    uint[] questionIds;
    uint[] answerIds;
    mapping(address => uint[]) ownerIdToQuestionIds;
    mapping(address => uint[]) ownerIdToAnswerIds;
    mapping(uint => Question) questionIdToQuestion;
    mapping(uint => Answer) answerIdToAnswer;
    mapping(uint => uint[]) questionIdToAnswerIds;

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
        uint questionId = uint(keccak256(abi.encodePacked(msg.sender, blockhash(block.number - 1))));
        ownerIdToQuestionIds[msg.sender].push(questionId);
        questionIds.push(questionId);
        questionIdToQuestion[questionId] = Question(questionId, msg.sender, _text);
    }

    function createAnswer(string _text, uint questionId) public {
        uint answerId = uint(keccak256(abi.encodePacked(msg.sender, blockhash(block.number - 1))));
        ownerIdToAnswerIds[msg.sender].push(answerId);
        answerIds.push(answerId);
        answerIdToAnswer[answerId] = Answer(answerId, msg.sender, questionId, _text);
        questionIdToAnswerIds[questionId].push(answerId);
    }

    function getQuestionIdsByOwnerId() public view returns (uint[]) {
        return ownerIdToQuestionIds[msg.sender];
    }

    function getQuestionText(uint _questionId) public view returns (uint questionId, address owner, string text) {
        Question question = questionIdToQuestion[_questionId];
        return (question.questionId, question.owner, question.text);
    }

    function getAnswerIdsByQuestionId(uint _questionId) public view returns (uint[]) {
        return questionIdToAnswerIds[_questionId];
    }

    function getAnswer(uint _answerId) public view returns (uint answerId, address owner, uint questionId, string text) {
        Answer answer = answerIdToAnswer[_answerId];
        return (answer.answerId, answer.owner, answer.questionId, answer.text);
    }

}
