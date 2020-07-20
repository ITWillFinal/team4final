<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/companyTop.jsp" %>
<style>

	td {
		border:solid 1px lightgray;
	}


</style>


<main>
	<%@ include file="../inc/companySidebar.jsp" %>
	
	<!-- main -->
	<div style="float: left; width:49%; margin-left:30px; font-size: 14px; border:1px solid lightgray">
		<form>
		<div style="margin:5px; height:95px; border:1px solid lightgray">
		위쪽 가로 긴 구역
		</div>

		<div style="margin:5px;">
		자사이력서양식<br><br>
		인적사항
			<table style="width: 700px;">
				<colgroup>
					<col style="width:25%;"/>
					<col style="width:75%;"/>
				</colgroup>
				<tr>
					<td>이름</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td></td>
				</tr>
				<tr>
					<td>주소</td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td></td>
				</tr>
			</table>
		</div><br>
		
		<div style="margin:5px;">
		학력사항 <input type="button" value="추가"> <!-- 추가 클릭시 테이블 추가 될 수 있도록 -->
			<table style="width: 700px;">
				<colgroup>
					<col style="width:25%;"/>
					<col style="width:75%;"/>
				</colgroup>
				<tr>
					<td>학교명</td>
					<td></td>
				</tr>
				<tr>
					<td>졸업일</td>
					<td></td>
				</tr>
			</table>
		</div><br>
		
		<div style="margin:5px;">
		경력사항 <input type="button" value="추가"> <!-- 추가 클릭시 테이블 추가 될 수 있도록 -->
			<table style="width: 700px;">
				<colgroup>
					<col style="width:25%;"/>
					<col style="width:75%;"/>
				</colgroup>
				<tr>
					<td>회사명</td>
					<td></td>
				</tr><tr>
					<td>직위</td>
					<td></td>
				</tr><tr>
					<td>근무기간</td>
					<td></td>
				</tr>
			</table>
		</div><br>
		
		<div style="margin:5px;">
		자격증 <input type="button" value="추가"> <!-- 추가 클릭시 테이블 추가 될 수 있도록 -->
			<table style="width: 700px;">
				<colgroup>
					<col style="width:25%;"/>
					<col style="width:75%;"/>
				</colgroup>
				<tr>
					<td>자격명</td>
					<td></td>
				</tr>
				<tr>
					<td>발급기관</td>
					<td></td>
				</tr>
				<tr>
					<td>취득일</td>
					<td></td>
				</tr>
			</table>
		</div><br>
		
		<div style="margin:5px;">
		외국어능력 <input type="button" value="추가"> <!-- 추가 클릭시 테이블 추가 될 수 있도록 -->
			<table style="width: 700px;">
				<colgroup>
					<col style="width:25%;"/>
					<col style="width:75%;"/>
				</colgroup>
				<tr>
					<td>종류</td>
					<td></td>
				</tr>
				<tr>
					<td>등급</td>
					<td></td>
				</tr>
				<tr>
					<td>평가년월</td>
					<td></td>
				</tr>
			</table>
		</div><br>
		
		<div style="margin:5px;">
		수상내역 <input type="button" value="추가"> <!-- 추가 클릭시 테이블 추가 될 수 있도록 -->
			<table style="width: 700px;">
				<colgroup>
					<col style="width:25%;"/>
					<col style="width:75%;"/>
				</colgroup>
				<tr>
					<td>수상일자</td>
					<td></td>
				</tr>
				<tr>
					<td>수상명</td>
					<td></td>
				</tr>
				<tr>
					<td>수여기관</td>
					<td></td>
				</tr>
			</table>
		</div><br>
		
		<div style="margin:5px;">
		자기소개서 <input type="button" value="추가"><br>
		항목 : <input type="text"><br>
		<textarea rows="7" cols="97"></textarea>
		</div><br>
		
		<div style="margin:5px;">
		자기PR <input type="button" value="추가"><br>
		<textarea rows="7" cols="97"></textarea>
		</div><br>
		
		<div style="width: 700px; text-align: center;">
			<input type="submit" value="양식제출">
		</div><br>
		
		</form>
	</div>
</main>
<%@ include file="../inc/companyBottom.jsp" %>