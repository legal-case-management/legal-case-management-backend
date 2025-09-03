package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import server.entity.Decision;
import server.mapper.DecisionMapper;
import server.repository.DecisionRepository;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DecisionService {
    DecisionRepository decisionRepository;

    DecisionMapper decisionMapper;


}
