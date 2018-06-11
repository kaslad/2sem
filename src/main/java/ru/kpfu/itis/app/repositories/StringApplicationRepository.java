package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.StringApplication;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.enums.StringApplicationState;

import java.util.List;
import java.util.Optional;

public interface StringApplicationRepository extends JpaRepository<StringApplication, Long> {
    List<StringApplication> findStringApplicationsByClient_Id(Long id);
    List<StringApplication> findStringApplicationsByClient(Long id);
    List<StringApplication> getStringApplicationsByStringer_Id(Long id);
    List<StringApplication> findAllByStringer(Stringer stringer);
    Optional<StringApplication> findOneById(Long Id);
    List<StringApplication> getStringApplicationsByState(StringApplicationState state);
    List<StringApplication> findAllByClientAndState(Client client, StringApplicationState state);
    List<StringApplication> findAllByStringerAndState(Stringer stringer, StringApplicationState state);


}
