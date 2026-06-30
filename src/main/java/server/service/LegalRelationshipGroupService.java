package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.legalRelationshipGroup.LegalRelationshipGroupRequest;
import server.dto.request.legalRelationshipGroup.LegalRelationshipGroupSearchRequest;
import server.dto.response.PageResponse;
import server.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import server.entity.LegalRelationshipGroup;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.LegalRelationshipGroupMapper;
import server.mapper.PageMapper;
import server.repository.LegalRelationshipGroupRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalRelationshipGroupService {
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;
    LegalRelationshipGroupMapper legalRelationshipGroupMapper;
    PageMapper pageMapper;

    @PreAuthorize("hasAuthority('CREATE_LEGAL_RELATIONSHIP_GROUP')")
    @Async
    @Synchronized
    @Transactional
    public void create(LegalRelationshipGroupRequest request) {
        LegalRelationshipGroup legalRelationshipGroup = LegalRelationshipGroup.builder().build();
        legalRelationshipGroupMapper.toLegalRelationshipGroup(request, legalRelationshipGroup);
        Integer maxId = legalRelationshipGroupRepository.getMaxId().orElse(0);

        String legalRelationshipGroupId = String.format("%s%02d", "N", maxId + 1);
        if (legalRelationshipGroupRepository.existsById(legalRelationshipGroupId)) {
            throw new AppException(ErrorCode.LEGAL_RELATIONSHIP_EXISTED);
        }

        legalRelationshipGroup.setLegalRelationshipGroupId(legalRelationshipGroupId);
        legalRelationshipGroupRepository.save(legalRelationshipGroup);
    }

    @PreAuthorize("hasAuthority('UPDATE_LEGAL_RELATIONSHIP_GROUP')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, LegalRelationshipGroupRequest request) {
        LegalRelationshipGroup existing = legalRelationshipGroupRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));
        legalRelationshipGroupMapper.toLegalRelationshipGroup(request, existing);
        legalRelationshipGroupRepository.save(existing);
    }

    @PreAuthorize("hasAuthority('DELETE_LEGAL_RELATIONSHIP_GROUP')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        LegalRelationshipGroup existing = legalRelationshipGroupRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));
        legalRelationshipGroupRepository.delete(existing);
    }

    public List<LegalRelationshipGroupResponse> getAll() {
        return legalRelationshipGroupRepository
                .findAll(Sort.by("legalRelationshipGroupId"))
                .stream().map(legalRelationshipGroupMapper::toLegalRelationshipGroupResponse)
                .toList();
    }

    @PreAuthorize("hasAuthority('VIEW_LEGAL_RELATIONSHIP_GROUP')")
    public PageResponse<LegalRelationshipGroupResponse> search(
            LegalRelationshipGroupSearchRequest request,
            int page, int size, String sortBy
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<LegalRelationshipGroupResponse> resultPage = legalRelationshipGroupRepository.search(
                request.getLegalRelationshipGroupId(),
                request.getLegalRelationshipGroupName(),
                pageable
        ).map(legalRelationshipGroupMapper::toLegalRelationshipGroupResponse);

        return pageMapper.map(resultPage);
    }
}
