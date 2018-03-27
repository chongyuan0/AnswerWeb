<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
        *{
            margin: 0;
            padding: 0;
            list-style: none;
        }
        .box{
            width: 300px;
            margin:50px auto;
            border:1px solid #ccc;

        }

        .fir li{
            width: 300px;
            line-height: 50px;
            border-bottom: 1px solid #ccc;
        }
        .fir li p{
            text-indent: 10px;
        }
        .sec li{
            line-height: 50px;
            width: 300px;
            border-top:1px solid #fff;
            background: #2d2c41;
            color:#fff;
            text-indent: 10px;
        }
        .sec{
            /*display: none;*/
        }
        .sec li:hover{
            background: red;
        }
    </style>
</head>
<body>
    <div class="box">
        <ul class="fir" id="first">
            <li v-for="(site,index) in datas">
            	<p v-on:click="loadSecond(site.typeno,index)">{{site.typename}}</p>
                <ul class="sec" v-if="index == flag">
                    <li v-for="ss in data1">{{ss.typename}}</li>
                </ul>
            </li>
        </ul>
    </div>
</body>
<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/vue.js"></script>
<script>
    var first = new Vue({
    	el: '#first',
    	data: {
    		datas : [],
    		data1:[],
    		flag: null
    	},
    	mounted(){
			this.load();
		},
    	methods: {
    		load: function(){
    			$.ajax({
					url:"${pageContext.request.contextPath}/user/getType",
					type:"POST",
					success: function(data){
							first.datas = data.firstlist;
							first.loadSecond(data.firstlist[0].typeno);
					}					
				});
    		},
    		loadSecond: function(id,index) {
				$.ajax({
					url: "${pageContext.request.contextPath}/user/getType/"+id,
					type: "POST",
					success: function(data) {
						first.data1 = data.secondlist;
					} 
				});
				first.flag = index;
    		}
    	}
    });
</script>
</html>