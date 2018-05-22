package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.StringApplication;

import java.util.List;

public interface StringApplicationRepository extends JpaRepository<StringApplication, Long> {
    List<StringApplication> findStringApplicationsByClient_Id(Long id);
    List<StringApplication> findStringApplicationsByClient(Long id);
    List<StringApplication> findStringApplicationsByStringer_Id(Long id);
    List<StringApplication> findStringApplicationsByStringer(Long id);



}
