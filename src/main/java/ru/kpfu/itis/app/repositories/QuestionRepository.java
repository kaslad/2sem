package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.Manager;
import ru.kpfu.itis.app.model.Question;

import java.util.List;
import java.util.Optional;
@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {
    Optional<Question> findOneById(Long id);

    List<Question> findAllByAuthor(Client author);

    List<Question> findAll();

    List<Question> findAllByCoach(Coach coach);
}