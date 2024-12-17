package fs.four.human.schedule.service;

import fs.four.human.schedule.dao.ScheduleDAO;
import fs.four.human.schedule.vo.ScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ScheduleDAO scheduleDAO;

    @Override
    public List<ScheduleVO> getSchedules() {
        List<ScheduleVO> schedules = scheduleDAO.getSchedules();

        // 데이터 로그 출력 (디버깅용)
        System.out.println("=== Schedule List ===");
        if (schedules != null && !schedules.isEmpty()) {
            for (ScheduleVO schedule : schedules) {
                System.out.println("Title: " + schedule.getT_title() +
                        ", Group: " + schedule.getT_group() +
                        ", e_id: " + schedule.getE_id());
            }
        } else {
            System.out.println("No schedules found.");
        }

        return schedules;
    }
}
