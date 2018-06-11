package ru.kpfu.itis.app.services;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.kpfu.itis.app.model.Document;
import ru.kpfu.itis.app.repositories.DocumentRepository;

import java.util.Optional;


@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentRepository documentRepository;

    @Override
    @SneakyThrows
    public Document saveDocument(MultipartFile file) {
        Document document = Document.builder()
                .content(file.getBytes())
                .build();
        return documentRepository.save(document);
    }

    @Override
    public Optional<Document> findById(Long id) {
        return documentRepository.findOneById(id);
    }
}
