<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>이미지 수정</title>
  <meta charset="utf-8">
</head>
<body>
 
<div class="container mt-3">
 
<h3>이미지 수정</h3>
  <form 
        action="/contents/updateFile"
        method="post"
        enctype="multipart/form-data"
        >   
    <input type="hidden" name="oldfile" value="${oldfile}">    
    <input type="hidden" name="contentsno" value="${contentsno}">    
        
    <div class="mb-3 mt-3">
      <label for="oldfile">원본파일</label>
      <div class="col-sm-6">
        <img src="/contents/storage/${oldfile }" 
        class="img-rounded" width="200px" height="200px">
      </div>
    </div>
    <div class="mb-3 mt-3">
      <label for="filenameMF">변경파일</label>
      <div class="col-sm-6">          
        <input type="file" class="form-control" id="filenameMF" 
        name="filenameMF" accept=".jpg,.png,.gif" required="required">
      </div>
    </div>
        <button type="submit" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-dark" 
        onclick="history.back()">취소</button>
 
  </form>
</div>
</body>
</html>