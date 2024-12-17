<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="${contextPath}/addressBook/register">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLabel">TEAM업무 등록하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
               <div class="modal-body">
                   <!-- 제목 -->
                   <div class="mb-3">
                       <label for="t_content" class="form-label"><i class="fa-regular fa-clipboard"></i> 내용</label>
                       <input type="text" class="form-control" id="t_content" name="t_content" required>
                   </div>

                   <!-- 중요도 -->
                   <div class="mb-3">
                       <label for="t_priority" class="form-label"><i class="fa-solid fa-triangle-exclamation"></i> 중요도</label>
                       <select id="t_priority" name="t_priority" class="form-select" required>
                           <option value="VU">매우 긴급 (Very Urgent)</option>
                           <option value="U">긴급 (Urgent)</option>
                           <option value="N">보통 (Normal)</option>
                           <option value="NU">천천히 (Non-Urgent)</option>
                       </select>
                   </div>

                   <!-- 진행상황 -->
                   <div class="mb-3">
                       <label for="t_stage" class="form-label"><i class="fa-solid fa-spinner"></i> 진행상황</label>
                       <select id="t_stage" name="t_stage" class="form-select" required>
                           <option value="P">예정 (Planned)</option>
                           <option value="PD">진행지연 (Progress Delayed)</option>
                           <option value="IP">진행중 (In Progress)</option>
                           <option value="CD">완료지연 (Completion Delayed)</option>
                           <option value="C">완료 (Completed)</option>
                       </select>
                   </div>
                    <!-- 일시 -->
                    <div class="mb-3">
                        <label for="date" class="form-label" display="inline-block"><i class="fa-regular fa-clock"></i>일시</label>
                        <label for="start-date" class="form-label" display="inline-block">시작일</label>
                        <label for="hour" class="form-label" display="inline-block">시간</label>
                        <label for="minute" class="form-label">분</label>
                        <input type="date" id="date" name="date" display="inline-block" required>
                        <select name="hour" display="inline-block" required>
                            <option name="select">시간</option>
                            <option name="six">06</option>
                            <option name="seven">07</option>
                            <option name="eight">08</option>
                            <option name="nine">09</option>
                            <option name="ten">10</option>
                            <option name="eleven">11</option>
                            <option name="twelve">12</option>
                            <option name="thirteen">13</option>
                            <option name="fourteen">14</option>
                            <option name="fifteen">15</option>
                            <option name="sixteen">16</option>
                            <option name="seventeen">17</option>
                            <option name="eighteen">18</option>
                            <option name="nineteen">19</option>
                            <option name="twenty">20</option>
                            <option name="twenty-one">21</option>
                            <option name="twenty-two">22</option>
                            <option name="twenty-three">23</option>
                        </select>
                        <select name="minute" display="inline-block" required>
                            <option name="zero">00</option>
                            <option name="half">30</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label" display="inline-block"><i class="fa-regular fa-clock"></i>일시</label>
                        <label for="start-date" class="form-label" display="inline-block">시작일</label>
                        <label for="hour" class="form-label" display="inline-block">시간</label>
                        <label for="minute" class="form-label">분</label>
                        <input type="date" id="date" name="date" display="inline-block" required>
                        <select name="hour" display="inline-block" required>
                            <option name="select">시간</option>
                            <option name="six">06</option>
                            <option name="seven">07</option>
                            <option name="eight">08</option>
                            <option name="nine">09</option>
                            <option name="ten">10</option>
                            <option name="eleven">11</option>
                            <option name="twelve">12</option>
                            <option name="thirteen">13</option>
                            <option name="fourteen">14</option>
                            <option name="fifteen">15</option>
                            <option name="sixteen">16</option>
                            <option name="seventeen">17</option>
                            <option name="eighteen">18</option>
                            <option name="nineteen">19</option>
                            <option name="twenty">20</option>
                            <option name="twenty-one">21</option>
                            <option name="twenty-two">22</option>
                            <option name="twenty-three">23</option>
                        </select>
                        <select name="minute" display="inline-block" required>
                            <option name="zero">00</option>
                            <option name="half">30</option>
                        </select>
                    </div>
                    <!-- 참여자 -->
                    <div class="mb-3">
                        <label for="participant" class="form-label"><i class="fa-solid fa-people-group"></i>참여자</label>
                        <input type="text" class="form-control" id="participant" name="participant" required>
                        <button onclick="location.href='${contextPath}/todo/participantModal'"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                    <!-- 내용 -->
                    <div class="mb-3">
                        <label for="content" class="form-label"><i class="fa-regular fa-note-sticky"></i>내용</label>
                        <textarea name="content" class="form-control" id="content" name="content" required>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">추가</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>