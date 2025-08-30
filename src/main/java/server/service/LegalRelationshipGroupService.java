package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.legalRelationshipGroup.LegalRelationshipGroupRequest;
import server.dto.request.legalRelationshipGroup.LegalRelationshipGroupSearchRequest;
import server.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import server.entity.LegalRelationshipGroup;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.LegalRelationshipGroupMapper;
import server.repository.LegalRelationshipGroupRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalRelationshipGroupService {
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;
    LegalRelationshipGroupMapper legalRelationshipGroupMapper;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void create(LegalRelationshipGroupRequest request) {
        LegalRelationshipGroup legalRelationshipGroup = LegalRelationshipGroup.builder().build();
        legalRelationshipGroupMapper.toLegalRelationshipGroup(request, legalRelationshipGroup);
        Integer maxId = legalRelationshipGroupRepository.getMaxId().orElse(0);
        legalRelationshipGroup.setLegalRelationshipGroupId("N" + String.format("%02d", maxId + 1));
        legalRelationshipGroupRepository.save(legalRelationshipGroup);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, LegalRelationshipGroupRequest request) {
        LegalRelationshipGroup existing = legalRelationshipGroupRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));
        legalRelationshipGroupMapper.toLegalRelationshipGroup(request, existing);
        legalRelationshipGroupRepository.save(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        LegalRelationshipGroup existing = legalRelationshipGroupRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));
        legalRelationshipGroupRepository.delete(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<LegalRelationshipGroupResponse> getAll() {
        return legalRelationshipGroupRepository
                .findAll()
                .stream().map(legalRelationshipGroupMapper::toLegalRelationshipGroupResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<LegalRelationshipGroupResponse> search(LegalRelationshipGroupSearchRequest request) {
        return legalRelationshipGroupRepository.search(
                        request.getLegalRelationshipGroupId(),
                        request.getLegalRelationshipGroupName()
                )
                .stream().map(legalRelationshipGroupMapper::toLegalRelationshipGroupResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<LegalRelationshipGroupResponse> getTop50() {
        return legalRelationshipGroupRepository
                .getTop50(PageRequest.of(0, 50))
                .stream().map(legalRelationshipGroupMapper::toLegalRelationshipGroupResponse)
                .toList();
    }
}
