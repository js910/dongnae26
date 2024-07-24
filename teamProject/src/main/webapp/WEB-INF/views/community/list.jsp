   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>
<h2>게시판 목록</h2>

<div>
    <form id="searchForm" action="/community/getList" method="post">
        <label for="type">검색 유형:</label>
        <select id="type" name="type">
            <option value="all">전체</option>
            <option value="community_title">제목</option>
            <option value="community_content">내용</option>
            <option value="region">거주지</option>
            <option value="writer">작성자</option>
        </select>
        <input type="text" name="keyword" placeholder="검색어 입력">
        <button type="submit">검색</button>
    </form>
</div>

<div>
	<label>Show 
		<select id="select1" name="dataTables">
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="15">15</option>
			<option value="20">20</option>
		</select>
	</label>
</div>

<div id="content">
    <table id="community_board">
        <thead>
            <tr>
                <th>글번호</th>
                <th>구</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody id="boardList">
            <!-- 게시물 목록을 여기에 렌더링 -->
        </tbody>
    </table>

    <div class="pagination" id="pagination">
        <!-- 페이지네이션 링크를 여기에 렌더링 -->
    </div>
</div>
<a href="/community/register" class="write-link">글 작성</a>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    // Event listener for pagination links
    document.getElementById('pagination').addEventListener('click', function(event) {
        if (event.target.tagName === 'A') {
            event.preventDefault();
            const page = event.target.getAttribute('data-page');
            fetchBoardList(page);
        }
    });

    // Event listener for search form submission
    document.getElementById('searchForm').addEventListener('submit', function(event) {
        event.preventDefault();
        fetchBoardList(1);  // Always fetch the first page on search
    });

    // Event listener for records per page dropdown
    document.getElementById('select1').addEventListener('change', function() {
        fetchBoardList(1);  // Fetch the first page when the records per page changes
    });

    // Function to fetch board list
    function fetchBoardList(page) {
        const form = document.getElementById('searchForm');
        const formData = new FormData(form);
        formData.append('pageNum', page);
        formData.append('amount', document.getElementById('select1').value);

        fetch('/community/getList', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            updateBoardList(data.boardlist);
            updatePagination(data.pageMaker);
        })
        .catch(error => console.error('Error fetching board list:', error));
    }

    // Function to update the board list in the table
    function updateBoardList(boardlist) {
        const boardListEl = document.getElementById('boardList');
        boardListEl.innerHTML = '';
        boardlist.forEach(board => {
            const row = `
                <tr>
                    <td>${board.community_bno}</td>
                    <td>${board.region}</td>
                    <td><a href="get?community_bno=${board.community_bno}">${board.community_title}</a></td>
                    <td>${board.community_content}</td>
                    <td>${board.writer}</td>
                    <td>${board.community_viewcnt}</td>
                    <td>${board.formattedRegdate}</td>
                </tr>
            `;
            boardListEl.insertAdjacentHTML('beforeend', row);
        });
    }

    // Function to update the pagination links
    function updatePagination(pageMaker) {
        const paginationEl = document.getElementById('pagination');
        paginationEl.innerHTML = '';
        if (pageMaker.prev) {
            paginationEl.insertAdjacentHTML('beforeend', `<a href="#" data-page="${pageMaker.startPage - 1}">Previous</a>`);
        }
        for (let page = pageMaker.startPage; page <= pageMaker.endPage; page++) {
            paginationEl.insertAdjacentHTML('beforeend', `<a href="#" data-page="${page}">${page}</a>`);
        }
        if (pageMaker.next) {
            paginationEl.insertAdjacentHTML('beforeend', `<a href="#" data-page="${pageMaker.endPage + 1}">Next</a>`);
        }
    }

    // Initial fetch of the board list
    fetchBoardList(1);
});
</script>
</body>
</html>
