package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.Question;
import ru.kpfu.itis.app.repositories.QuestionRepository;

import java.sql.Date;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionRepository questionRepository;

    @Override
    public Optional<Question> findOneById(Long id) {
        return questionRepository.findOneById(id);
    }

    @Override
    public List<Question> findAllByAuthor(Client author) {
        List<Question> ret = questionRepository.findAllByAuthor(author);
        sortByDate(ret, true);
        return ret;
    }

    private void sortByDate(List<Question> ret, boolean inv) {
        Collections.sort(ret, Comparator.comparing(Question::getDate));
        if (inv) Collections.reverse(ret);
    }

    @Override
    public List<Question> findAll() {
        List<Question> ret = questionRepository.findAll();
        sortByDate(ret, true);
        return ret;
    }

    @Override
    public Question addQuestion(String content, Client client) {
        Question question = Question.builder()
                .author(client)
                .date(new Date(System.currentTimeMillis()))
                .content(content)
                .answered(false)
                .build();
        return questionRepository.save(question);
    }

    @Override
    public Question answer(Question question, String answer, Coach coach) {
        question.setAnswer(answer);
        question.setAnswered(true);
        question.setCoach(coach);
        return questionRepository.save(question);
    }
}
