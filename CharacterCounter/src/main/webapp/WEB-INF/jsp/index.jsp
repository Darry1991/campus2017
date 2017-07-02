<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <style type="text/css">
        .container
        {
            width:500px;
            height:750px;
            border:1px solid;
            margin:0 auto;
        }
        .button_class {
            margin-left:30px;
            margin-top: 10px;
        }
        .float_right {
            float:right;
        }
        .margin_right_30 {
            margin-right:30px;
        }
        .input_content {
            margin-top:10px;
            margin-left:30px;
        }
        .margin_left_30{
            margin-left:30px;
        }
        th,td{
            height:30px;
            width:150px;
            text-align: center;
        }
    </style>
    <title>字符数量计算</title>
    <meta http-equiv="content-type" content="text/html" charset="UTF-8">
    <script>
        function Show(e){
            var formFile=document.getElementById('formFile');
            var formText=document.getElementById('formText');
            formFile.style.display=e.value=="0"?'block':'none';
            formText.style.display=e.value=="0"?'none':'block';
        }
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<div class="container">
    <div class="file_part">
        <p style="margin-left:26px">
            <input name="inputone" type="radio" value="0" onclick="Show(this)"/>文件上传
            <input name="inputtwo" type="radio" value="1" onclick="Show(this)"/>文本上传
        </p>
        <form action="/fileSend" method="post" enctype="multipart/form-data" id="formFile">
            <p class="margin_left_30">统计文件内容，请输入文件</p>
            <input type="file" class="button_class" name="file"/>
            <input type="submit" class="button_class float_right margin_right_30" value="统计"/>
        </form>
        <form action="/textSend" method="post" id="formText">
            <p class="margin_left_30">统计文本内容，请输入一段文字</p>
            <div class="input_content">
                <textarea name="text" id="text" cols="60" rows="10"></textarea>
            </div>
            <div class="button_button">
                <button type="submit" class="button_class">统计</button>
                <button type="reset" class="button_class float_right margin_right_30">清除内容</button>
            </div>
        </form>
    </div>
    <!--统计部分-->
    <div class="count_part margin_left_30">
        <div class="numbers_of_every_word">
            <p>统计的内容如下:</p>
            <table border="1">
                <thead>
                <tr>
                    <th>统计项</th>
                    <th>个数</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>英文字母</td>
                    <td>${result.alphabet}</td>
                </tr>
                <tr>
                    <td>数字</td>
                    <td>${result.number}</td>
                </tr>
                <tr>
                    <td>中文汉字</td>
                    <td>${result.chinese}</td>
                </tr>
                <tr>
                    <td>中英文标点符号</td>
                    <td>${result.punctuation}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--统计数目前三的中文字符-->
        <div class="top3_of_everyword">
            <p>文字中出现频率最高的三个字是:</p>
            <table border="1">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>个数</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${result.chineseList[0].chinese}</td>
                    <td>${result.chineseList[0].count}</td>
                </tr>
                <tr>
                    <td>${result.chineseList[1].chinese}</td>
                    <td>${result.chineseList[1].count}</td>
                </tr>
                <tr>
                    <td>${result.chineseList[2].chinese}</td>
                    <td>${result.chineseList[2].count}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>