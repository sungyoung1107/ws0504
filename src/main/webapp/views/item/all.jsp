<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let item_search = {
        init: function () {
            $("#search_btn").click(function () {
                if(isNaN($("#minimum_price").val())){
                    alert("가격 범위 최소금액은 숫자로 입력하세요");
                    return;
                }
                if(isNaN($("#maximum_price").val())){
                    alert("가격 범위 최대금액은 숫자로 입력하세요");
                    return;
                }
                $("#search_form").attr({
                    method: 'get',
                    action: '/item/search'
                });
                $("#search_form").submit();
            })
        }
    }

    $(function () {
        item_search.init();
    })
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item All</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item All</h6>
            <form class="form-inline well" id="search_form" action="">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">NAME: </label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="name" placeholder="Enter name"
                               name="name" value=${ms.name}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="minimum_price">MINIMUM_PRICE: </label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="minimum_price" placeholder="Minimum_price"
                               name="minimum_price" value=${ms.minimum_price}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="maximum_price">MAXIMUM_PRICE: </label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="maximum_price" placeholder="Maximum_price"
                               name="maximum_price" value=${ms.maximum_price}>
                    </div>
                </div><br>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button type="button" id="search_btn" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>IMGNAME</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>RDATE</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>IMGNAME</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>RDATE</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${ilist}">
                        <tr>
                            <td>
                                <a href="" data-toggle="modal" data-target="#target${obj.id}">
                                    <img src="/uimg/${obj.imgname}" style="width: 30px; height: 30px"/>
                                </a>
                            </td>
                            <td><a href="/item/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" type="currency"/></td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        <!-- Modal -->
                        <div class="modal fade" id="target${obj.id}" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.name}</p>
                                        <p><img src="/uimg/${obj.imgname}" style="width: 300px; height: 300px"/></p>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/item/detail?id=${obj.id}" class="btn btn-info"
                                           role="button">Detail</a>
                                        <a href="/item/detail?id=${obj.id}" class="btn btn-info" role="button"
                                           data-dismiss="modal">Close</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

