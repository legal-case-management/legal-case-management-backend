package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import server.mapper.LegalRelationshipMapper;
import server.repository.LegalRelationshipRepository;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalRelationshipService {
     LegalRelationshipRepository legalRelationshipRepository;
     LegalRelationshipMapper legalRelationshipMapper;

//     @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
//     public List<LegalRelationshipResponse> getAll() {
//         return legalRelationshipRepository
//                 .findAll()
//                 .stream().map(legalRelationshipMapper::toLegalRelationshipResponse)
//                 .toList();
//     }
//
//     @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
//     public void create(LegalRelationshipRequest request) {
//         LegalRelationship legalRelationship = new LegalRelationship();
//         legalRelationshipMapper.toLegalRelationship(request, legalRelationship);
//         legalRelationshipRepository.save(legalRelationship);
//     }
//
//     @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
//     public void update(String id, LegalRelationshipRequest request) {
//         LegalRelationship existing = legalRelationshipRepository.findById(id)
//                 .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));
//
//         legalRelationshipMapper.toLegalRelationship(request, existing);
//         legalRelationshipRepository.save(existing);
//     }
}
