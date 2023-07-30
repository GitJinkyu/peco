<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- editForm.jsp -->
<form id="editForm">
    <!-- 여기에 폼 필드를 추가하여 수정할 데이터를 입력하는 부분을 작성 -->
    <input type="text" name="title" id="title" value="${board.title}">
    <textarea name="content"  id="content">${board.content}</textarea>
    <!-- ... 추가적인 필드들 ... -->
    <button type="button" onclick="edit()">수정 완료</button>
</form>

<script>
function edit() {
    let bno = "${board.bno}";
    let title = document.querySelector('#title').value;
    let content = document.querySelector('#content').value;

    let formData = {
        bno: bno,
        title: title,
        content: content
    };

    let jsonData = JSON.stringify(formData);

    let xhr = new XMLHttpRequest();

    xhr.open("PUT", `/rest/edit/${bno}`, true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                // 성공적인 응답을 받았을 때 처리
                window.location.href = `/rest/${bno}`;
            } else {
                // 실패 응답을 받았을 때 처리
                alert("수정에 실패했습니다.");
            }
        }
    };

    xhr.send(jsonData);
}

</script>

</body>
</html>