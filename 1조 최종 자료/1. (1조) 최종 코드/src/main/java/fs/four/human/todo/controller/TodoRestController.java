package fs.four.human.todo.controller;

import fs.four.human.common.service.CommonService;
import fs.four.human.common.vo.CommonVO;
import fs.four.human.todo.service.TodoService;
import fs.four.human.todo.vo.ResponseDTO;
import fs.four.human.todo.vo.Todo2VO;
import fs.four.human.todo.vo.TodoVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/todo")
public class TodoRestController {
    @Autowired
    TodoService todoService;

    @PostMapping("/todos")
    public ResponseEntity<ResponseDTO<String>> addTodo(@RequestBody Todo2VO todoVO, HttpSession session) {
        String loginUserID = (String) session.getAttribute("loginUserID");
        System.out.println("loginUserID: "+ loginUserID);
        todoVO.setT_updated_id(loginUserID);

        CommonVO commonVO = todoService.getEmployeeById(loginUserID);
        todoVO.setT_dept(commonVO.getE_dept());
        todoService.addTodo(todoVO);

        return new ResponseEntity<>(new ResponseDTO<String>("success", null), HttpStatus.OK);
    }
    @PutMapping("/update/{id}")
    public ResponseEntity<String> updateTodo(@PathVariable("id") String id, @RequestBody TodoVO todoVO) {
        if (todoVO.getT_title() == null || todoVO.getT_title().isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Title cannot be empty");
        }
        if (todoVO.getT_stage() == null || todoVO.getT_stage().equals("진행상황을 선택")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Stage cannot be empty");
        }

        todoVO.setT_id(id);
        int result = todoService.updateTodo(todoVO);

        if (result > 0) {
            return ResponseEntity.ok("Update successful");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Update failed");
        }
    }

    // 수정
    @PutMapping("/update-todos")
    public ResponseEntity<ResponseDTO<String>> updateTodo(@RequestBody Todo2VO todoVO, HttpSession session) {
        String loginUserID = (String) session.getAttribute("loginUserID");
        System.out.println("loginUserID: "+ loginUserID);
        todoVO.setT_updated_id(loginUserID);

        CommonVO commonVO = todoService.getEmployeeById(loginUserID);
        todoVO.setT_dept(commonVO.getE_dept());
        todoService.updateTodo2(todoVO);

        return new ResponseEntity<>(new ResponseDTO<String>("success", null), HttpStatus.OK);
    }
}
