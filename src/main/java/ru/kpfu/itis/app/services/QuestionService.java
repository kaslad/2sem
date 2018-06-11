package ru.kpfu.itis.app.services;

import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.Question;

import java.util.List;
import java.util.Optional;

public interface QuestionService {
    Optional<Question> findOneById(Long id);

    List<Question> findAllByAuthor(Client author);

    List<Question> findAll();

    Question addQuestion(String content, Client client);

    Question answer(Question question, String answer, Coach coach);
}
