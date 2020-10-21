<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>疫情数据录入</title>
    <jsp:include page="./template/common.jsp"></jsp:include>
    <link rel="stylesheet" href="../bootstrap/datepicker/bootstrap-datepicker3.css" type="text/css"/>
</head>
<body>
<div class="container">
    <jsp:include page="./template/top.jsp"/>
    <div class="row">
        <div class="col-md-3">
            <jsp:include page="./template/menu.jsp"/>
        </div>
        <div class="col-md-9">
            <ul class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp">主页</a></li>
                <li>数据录入</li>
            </ul>
            <div class="row">
                <div class="col-md-4">
                    <div class="input-group date" id="datepicker" data-date-format="yyyy-mm-dd">
                        <div class="input-group-addon">数据日期：</div>
                        <input class="form-control" size="16" type="text" value="" readonly id="dataDate">
                        <div class="input-group-addon"><span class="add-on glyphicon glyphicon-calendar"></span></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary" id="btnSubmit">提交 <span
                            class="glyphicon glyphicon-log-in"></span></button>
                </div>
            </div>
            <br/>
            <div class="row">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>省份</th>
                        <th>确诊人数</th>
                        <th>疑似人数</th>
                        <th>隔离人数</th>
                        <th>治愈人数</th>
                        <th>死亡人数</th>
                    </tr>
                    </thead>
                    <tbody id="body1">
                    <tr>
                        <td>湖北</td>
                        <td><input type="text" name="affirmed" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="suspected" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="isolated" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="cured" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="dead" size="4" maxlength="4" class="form-control"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div id="msg"></div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
</body>
</html>
<script>

    var provinces = null;

    $(function () {

        //设置日期输入框的初始值和取值范围
        var datepicker = $("#datepicker");
        datepicker.datepicker({
            language: 'zh-CN',
            autoclose: true
        });
        var current = new Date();
        datepicker.datepicker("setDate", current);
        var date1 = new Date();
        date1.setDate(current.getDate() - 7);
        datepicker.datepicker("setStartDate", date1);
        datepicker.datepicker("setEndDate", current);

        //给日期选择框设置事件处理函数
        datepicker.datepicker().on("changeDate", loadProvinceList);
        loadProvinceList();

        //提交事件
        $("#btnSubmit").click(checkAndSubmitData);
    });

    function loadProvinceList() {
        //获取当前日期
        var date = $("#dataDate").val();
        //使用ajax从服务器获取还没有录入数据的省份列表
        $.get("${pageContext.request.contextPath}/province/ajax/noDataList0", {"date": date}, function (resp) {
            //console.info(resp);
            if (resp.code < 0) {
                alert(resp.msg);
            } else {
                fillProvinceToTable(resp.data);
            }
        }, "json");
    }

    //把数据填充到省份列表中
    function fillProvinceToTable(array) {
        //清空表格
        var body1 = $("#body1");
        body1.empty();

        if (array != null && array.length > 0) {
            provinces = array;
            //填充到table中
            $.each(array, function (index, province) {
                var tr = $("<tr>");
                var td = $("<td>");
                td.text(province.provinceName);
                tr.append(td);

                td = $("<td>");
                td.html('<input type="text" name="affirmed" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);

                td = $("<td>");
                td.html('<input type="text" name="suspected" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);

                td = $("<td>");
                td.html('<input type="text" name="isolated" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);

                td = $("<td>");
                td.html('<input type="text" name="cured" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);

                td = $("<td>");
                td.html('<input type="text" name="dead" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);
                body1.append(tr);
            })
        } else {
            $("#msg").html("本日所有的省份都已经录入了数据！");
        }
    }

    function checkAndSubmitData() {
        var valid = true;
        var affirmed = $("input[name=affirmed]");
        var suspected = $("input[name=suspected]");
        var isolated = $("input[name=isolated]");
        var cured = $("input[name=cured]");
        var dead = $("input[name=dead]");

        $.each(affirmed,function (index,element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        });
        $.each(suspected,function (index,element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        });
        $.each(isolated,function (index,element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        });
        $.each(cured,function (index,element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        });
        $.each(dead,function (index,element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        });
        if(valid){
            //执行提交
            //console.info(provinces);
            var dataArray = []; //创建一个数组
            for (var i =0;i<provinces.length;i++){
                var obj={}; //创建一个对象
                obj.provinceId = provinces[i].provinceId;
                obj.affirmed=affirmed[i].value;
                obj.suspected=suspected[i].value;
                obj.isolated=isolated[i].value;
                obj.cured=cured[i].value;
                obj.dead=dead[i].value;
                dataArray.push(obj);
            }
            console.info(dataArray)
            var date = $("#dataDate").val();
            var data={};  //创建一个新对象
            data.date = date;
            data.array = dataArray;

            $.ajax({
                url:"${pageContext.request.contextPath}/epidemicData/ajax/input",
                type:"post",
                contentType:"application/json",
                data:JSON.stringify(data),
                dataType:"json",
                success:function (resp) {
                    if(resp.code<0){
                        alert(resp.msg);
                    }else{
                        fillProvinceToTable(resp.data);
                    }
                }
            });
        }else{
            alert("请检查你的输入，确保输入有效的数值！")
        }
    }

</script>
