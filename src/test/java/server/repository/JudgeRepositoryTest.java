package server.repository;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import server.repository.JudgeRepository;
import server.utils.DateUtils;

import java.util.List;

@DataJpaTest
@FieldDefaults(level = AccessLevel.PRIVATE)
public class JudgeRepositoryTest {
    @Autowired
    JudgeRepository judgeRepository;

    @Test
    void testGetAssignAssignmentRaw(){
        List<Object[]> result = judgeRepository.getAssignAssignmentRaw(
                DateUtils.getMilestoneDateTime(),
                null,
                true
        );

        result.forEach(objects -> {
            System.out.println("[0]: " + objects[0]);
            System.out.println("[1]: " + objects[1]);
            System.out.println("[2]: " + objects[2]);
            System.out.println("[3]: " + objects[3]);
        });
    }
}
