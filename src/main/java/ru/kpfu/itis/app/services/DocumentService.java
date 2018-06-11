package ru.kpfu.itis.app.services;

import lombok.SneakyThrows;
import org.springframework.web.multipart.MultipartFile;
import ru.kpfu.itis.app.model.Document;

import java.util.Optional;

public interface DocumentService {
    @SneakyThrows
    Document saveDocument(MultipartFile file);

    Optional<Document> findById(Long id);
}
