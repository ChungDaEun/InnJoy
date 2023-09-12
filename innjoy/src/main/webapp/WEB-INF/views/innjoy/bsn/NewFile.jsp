<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="container" action="/articles/create" method="post">
  <div class="mb-3">
    <label class="form-label">제목</label>
    <!-- 입력값: title -->
    <input type="text" class="form-control" name="title">
  </div>
  <div class="mb-3">
    <label class="form-label">내용</label>
    <!-- 입력값: content -->
    <textarea class="form-control" rows="3" name="content"></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>