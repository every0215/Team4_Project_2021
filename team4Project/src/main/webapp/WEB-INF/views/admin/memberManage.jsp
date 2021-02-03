<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    
    
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="<c:url value='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="<c:url value='http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/plugins/morris/morris.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/plugins/morris/morris.css'/>" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.css'/>" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker-bs3.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/plugins/daterangepicker/daterangepicker-bs3.css'/>" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/dist/css/AdminLTE.min.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/dist/css/AdminLTE.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/dist/css/skins/_all-skins.min.css'/>" rel="stylesheet" type="text/css" />

	<link href="<c:url value='/css/luke-style.css' />" rel="stylesheet">
</head>

<style>
.pagination {
  display: flex;
}
.pagination button {
  width: 2rem;
  height: 2rem;
  margin: 1rem 0;
  color: #0099bc;
  background-color: white;
  border: 1px solid #0099bc;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}
.pagination button:hover {
  background-color: #bef3ff;
}
.pagination button.pg-number {
  border-radius: 0;
}
.pagination button.pg-number:disabled {
  color: white;
  background-color: #0099bc;
}
.pagination button.pg-prev, .pagination button.pg-next {
  border-radius: 0;
}
.pagination button:first-child {
  width: 2.5rem;
  border-radius: 100px 0 0 100px;
}
.pagination button:last-child {
  width: 2.5rem;
  border-radius: 0 100px 100px 0;
}
.pagination button.pg-first:disabled, .pagination button.pg-last:disabled, .pagination button.pg-prev:disabled, .pagination button.pg-next:disabled {
  cursor: not-allowed;
}
.pagination button + button {
  border-left: 0;
}


/********************/
/* Luke Search */
/********************/
.visuallyhidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px; }

h1,
h2,
h3,
h4,
h5 {
  border-bottom: 1px solid #ccc;
    font-size: 25px;
    font-weight: bold;
    margin-bottom: 20px;
    padding-bottom: 15px; }


input {
  width: calc(100% - 10px);
  min-height: 30px;
  padding-left: 5px;
  padding-right: 5px;
  letter-spacing: .5px;
  border: 0;
  border-bottom: 2px solid #f0f0f0; }
  input:valid {
    border-color: #24cf5f; }
  input:focus {
    outline: none;
    border-color: #fbcf34; }

.form-list {
  padding-left: 0;
  list-style: none; }
.form-list__row {
    margin-bottom: 25px; }
.form-list__row label {
      position: relative;
      display: block;
      text-transform: uppercase;
      font-weight: 600;
      font-size: 12px;
      letter-spacing: .5px;
      color: #717171; }
.form-list__row--inline {
      display: flex;
      justify-content: space-between; }
.form-list__row--inline > :first-child {
        flex: 2;
        padding-right: 20px; }
.form-list__row--inline > :nth-child(2n) {
        flex: 1; }
.form-list__input-inline {
    display: flex;
    justify-content: space-between; }
.form-list__input-inline > * {
      width: calc(50% - 10px - 10px); }
.form-list__row--agree {
    margin-top: 30px;
    margin-bottom: 30px;
    font-size: 12px; }
.form-list__row--agree label {
      font-weight: 400;
      text-transform: none;
      color: #676767; }
.form-list__row--agree input {
      width: auto;
      margin-right: 5px; }

#input--cc {
  position: relative;
  padding-top: 6px; }
#input--cc input {
    padding-left: 46px;
    width: calc(100% - 46px); }
#input--cc:before {
    content: '';
    position: absolute;
    left: 0;
    top: 50%;
    width: 36px;
    height: 45px;
    background-image: url("data:image/svg+xml;utf8,%3Csvg%20class%3D%22nc-icon%20glyph%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%20x%3D%220px%22%20y%3D%220px%22%20width%3D%2248px%22%20height%3D%2248px%22%20viewBox%3D%220%200%2048%2048%22%3E%3Cg%3E%20%3Cpath%20data-color%3D%22color-2%22%20fill%3D%22%238c8c8c%22%20d%3D%22M47%2C16V9c0-1.105-0.895-2-2-2H3C1.895%2C7%2C1%2C7.895%2C1%2C9v7H47z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%238c8c8c%22%20d%3D%22M1%2C22v17c0%2C1.105%2C0.895%2C2%2C2%2C2h42c1.105%2C0%2C2-0.895%2C2-2V22H1z%20M18%2C33H8c-0.552%2C0-1-0.448-1-1s0.448-1%2C1-1h10%20c0.552%2C0%2C1%2C0.448%2C1%2C1S18.552%2C33%2C18%2C33z%20M40%2C33h-5c-0.552%2C0-1-0.448-1-1s0.448-1%2C1-1h5c0.552%2C0%2C1%2C0.448%2C1%2C1S40.552%2C33%2C40%2C33z%22%3E%3C/path%3E%20%3C/g%3E%3C/svg%3E");
    background-position: center;
    background-repeat: no-repeat;
    background-size: 36px;
    transform: translateY(-50%); }

#input--cc.creditcard-icon--visa:before {
  background-image: url("data:image/svg+xml;utf8,%3Csvg%20class%3D%22nc-icon%20colored%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%20x%3D%220px%22%20y%3D%220px%22%20width%3D%2248px%22%20height%3D%2248px%22%20viewBox%3D%220%200%2048%2048%22%3E%3Cg%3E%3Crect%20x%3D%221%22%20y%3D%2214%22%20fill%3D%22%23E6E6E6%22%20width%3D%2246%22%20height%3D%2219%22%3E%3C/rect%3E%20%3Cpath%20fill%3D%22%23E79800%22%20d%3D%22M4%2C41h40c1.657%2C0%2C3-1.343%2C3-3v-5H1v5C1%2C39.657%2C2.343%2C41%2C4%2C41z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%231A1876%22%20d%3D%22M44%2C7H4c-1.657%2C0-3%2C1.343-3%2C3v5h46v-5C47%2C8.343%2C45.657%2C7%2C44%2C7z%22%3E%3C/path%3E%20%3Cpolygon%20fill%3D%22%231A1876%22%20points%3D%2219.238%2C28.8%2021.847%2C28.8%2023.48%2C19.224%2020.87%2C19.224%20%22%3E%3C/polygon%3E%20%3Cpath%20fill%3D%22%231A1876%22%20d%3D%22M28.743%2C23.069c-0.912-0.443-1.471-0.739-1.465-1.187c0-0.398%2C0.473-0.824%2C1.495-0.824%20c0.836-0.013%2C1.51%2C0.157%2C2.188%2C0.477l0.354-2.076c-0.517-0.194-1.327-0.402-2.339-0.402c-2.579%2C0-4.396%2C1.299-4.411%2C3.16%20c-0.015%2C1.376%2C1.297%2C2.144%2C2.287%2C2.602c1.016%2C0.469%2C1.358%2C0.769%2C1.353%2C1.188c-0.006%2C0.642-0.811%2C0.935-1.562%2C0.935%20c-1.158%2C0-1.742-0.179-2.793-0.655l-0.366%2C2.144c0.61%2C0.267%2C1.737%2C0.499%2C2.908%2C0.511c2.744%2C0%2C4.525-1.284%2C4.545-3.272%20C30.944%2C24.581%2C30.249%2C23.752%2C28.743%2C23.069z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%231A1876%22%20d%3D%22M38.007%2C19.233H35.99c-0.625%2C0-1.092%2C0.171-1.367%2C0.794l-3.876%2C8.776h2.741c0%2C0%2C0.448-1.18%2C0.55-1.439%20c0.3%2C0%2C2.962%2C0.004%2C3.343%2C0.004c0.078%2C0.335%2C0.318%2C1.435%2C0.318%2C1.435h2.422L38.007%2C19.233z%20M34.789%2C25.406%20c0.108-0.276%2C1.173-3.011%2C1.386-3.591c0.353%2C1.651%2C0.009%2C0.049%2C0.781%2C3.591H34.789z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%231A1876%22%20d%3D%22M17.049%2C19.231l-2.556%2C6.53l-0.272-1.327l-0.915-4.401c-0.158-0.606-0.616-0.787-1.183-0.808H7.913%20L7.88%2C19.424c1.024%2C0.248%2C1.939%2C0.606%2C2.742%2C1.05l2.321%2C8.317l2.762-0.003l4.109-9.558H17.049z%22%3E%3C/path%3E%3C/g%3E%3C/svg%3E"); }

#input--cc.creditcard-icon--master-card:before {
  background-image: url("data:image/svg+xml;utf8,%3Csvg%20class%3D%22nc-icon%20colored%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%20x%3D%220px%22%20y%3D%220px%22%20width%3D%2248px%22%20height%3D%2248px%22%20viewBox%3D%220%200%2048%2048%22%3E%3Cg%3E%3Cpath%20fill%3D%22%23003564%22%20d%3D%22M44%2C7H4c-1.657%2C0-3%2C1.343-3%2C3v28c0%2C1.657%2C1.343%2C3%2C3%2C3h40c1.657%2C0%2C3-1.343%2C3-3V10C47%2C8.343%2C45.657%2C7%2C44%2C7z%22%3E%3C/path%3E%20%3Ccircle%20fill%3D%22%23F01524%22%20cx%3D%2219%22%20cy%3D%2224%22%20r%3D%228%22%3E%3C/circle%3E%20%3Cpath%20fill%3D%22%23376BD1%22%20d%3D%22M24%2C30.24c0.093-0.075%2C0.177-0.161%2C0.267-0.24h-0.535C23.823%2C30.079%2C23.907%2C30.165%2C24%2C30.24z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%23FEB415%22%20d%3D%22M29%2C16c-2.525%2C0-4.773%2C1.173-6.24%2C3h2.48c0.251%2C0.313%2C0.47%2C0.651%2C0.673%2C1h-3.827h-0.008%20c-0.186%2C0.321-0.352%2C0.653-0.492%2C1h0.009h4.809c0.132%2C0.324%2C0.246%2C0.656%2C0.335%2C1h-5.477c-0.084%2C0.326-0.151%2C0.659-0.193%2C1h5.865%20C26.975%2C23.328%2C27%2C23.661%2C27%2C24h-6c0%2C0.339%2C0.028%2C0.672%2C0.069%2C1h5.865c-0.043%2C0.341-0.111%2C0.674-0.195%2C1h-5.477%20c0.088%2C0.342%2C0.194%2C0.677%2C0.325%2C1h0.009h4.809c-0.141%2C0.346-0.305%2C0.68-0.491%2C1h-3.827h-0.008c0.203%2C0.351%2C0.429%2C0.686%2C0.681%2C1h2.48%20c-0.292%2C0.363-0.623%2C0.693-0.973%2C1h-0.535h-0.012c1.409%2C1.241%2C3.254%2C2%2C5.279%2C2c4.418%2C0%2C8-3.582%2C8-8S33.418%2C16%2C29%2C16z%22%3E%3C/path%3E%3C/g%3E%3C/svg%3E"); }

#input--cc.creditcard-icon--american-express:before {
  background-image: url("data:image/svg+xml;utf8,%3Csvg%20class%3D%22nc-icon%20colored%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%20x%3D%220px%22%20y%3D%220px%22%20width%3D%2248px%22%20height%3D%2248px%22%20viewBox%3D%220%200%2048%2048%22%3E%3Cg%3E%3Cpath%20fill%3D%22%23007AC6%22%20d%3D%22M44%2C7H4c-1.657%2C0-3%2C1.343-3%2C3v28c0%2C1.657%2C1.343%2C3%2C3%2C3h40c1.657%2C0%2C3-1.343%2C3-3V10C47%2C8.343%2C45.657%2C7%2C44%2C7z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%23FFFFFF%22%20d%3D%22M10.533%2C24.429h2.33l-1.165-2.857L10.533%2C24.429z%20M43%2C19h-5.969l-1.456%2C1.571L34.264%2C19H21.598l-1.165%2C2.571%20L19.268%2C19h-5.096v1.143L13.59%2C19H9.222L5%2C29h5.096l0.582-1.571h1.456L12.716%2C29h5.678v-1.143L18.831%2C29h2.912l0.437-1.286V29%20h11.648l1.456-1.571L36.594%2C29h5.969l-3.785-5L43%2C19z%20M25.383%2C27.571h-1.602V22l-2.475%2C5.571h-1.456L17.375%2C22v5.571h-3.349%20L13.444%2C26H9.95l-0.582%2C1.571H7.475l3.057-7.143h2.475l2.766%2C6.714v-6.714h2.766l2.184%2C4.857l2.038-4.857h2.766v7.143H25.383z%20M39.797%2C27.571h-2.184l-1.893-2.429l-2.184%2C2.429h-6.552v-7.143h6.697l2.038%2C2.286l2.184-2.286h2.038L36.739%2C24L39.797%2C27.571z%20M28.586%2C21.857v1.286h3.64v1.429h-3.64V26h4.077l1.893-2.143l-1.747-2H28.586z%22%3E%3C/path%3E%3C/g%3E%3C/svg%3E"); }

#input--cc.creditcard-icon--discover:before {
  background-image: url("data:image/svg+xml;utf8,%3Csvg%20class%3D%22nc-icon%20colored%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%20x%3D%220px%22%20y%3D%220px%22%20width%3D%2248px%22%20height%3D%2248px%22%20viewBox%3D%220%200%2048%2048%22%3E%3Cg%3E%3Cpath%20fill%3D%22%23E6E6E6%22%20d%3D%22M47%2C23.807V10c0-1.657-1.343-3-3-3H4c-1.657%2C0-3%2C1.343-3%2C3v28c0%2C1.657%2C1.343%2C3%2C3%2C3h10.589%20C30.229%2C38.811%2C43.003%2C30.094%2C47%2C23.807z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%23E6E6E6%22%20d%3D%22M47%2C38V23.807C43.003%2C30.094%2C30.229%2C38.811%2C14.589%2C41H44C45.657%2C41%2C47%2C39.657%2C47%2C38z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%23FA7000%22%20d%3D%22M47%2C38V23.807C43.003%2C30.094%2C30.229%2C38.811%2C14.589%2C41H44C45.657%2C41%2C47%2C39.657%2C47%2C38z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%23FA7000%22%20d%3D%22M25.029%2C21.013c-1.69%2C0-3.062%2C1.32-3.062%2C2.951c0%2C1.734%2C1.312%2C3.028%2C3.062%2C3.028%20c1.708%2C0%2C3.054-1.313%2C3.054-2.995C28.084%2C22.325%2C26.747%2C21.013%2C25.029%2C21.013z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%23444444%22%20d%3D%22M7.646%2C21.121H6v5.743h1.636c0.871%2C0%2C1.499-0.207%2C2.05-0.664c0.654-0.541%2C1.043-1.359%2C1.043-2.206%20C10.728%2C22.298%2C9.462%2C21.121%2C7.646%2C21.121z%20M8.956%2C25.434c-0.356%2C0.318-0.81%2C0.457-1.535%2C0.457H7.121v-3.798h0.301%20c0.725%2C0%2C1.161%2C0.13%2C1.535%2C0.464c0.385%2C0.345%2C0.617%2C0.878%2C0.617%2C1.429C9.573%2C24.539%2C9.342%2C25.091%2C8.956%2C25.434z%22%3E%3C/path%3E%20%3Crect%20x%3D%2211.245%22%20y%3D%2221.121%22%20fill%3D%22%23444444%22%20width%3D%221.116%22%20height%3D%225.743%22%3E%3C/rect%3E%20%3Cpath%20fill%3D%22%23444444%22%20d%3D%22M15.102%2C23.322c-0.674-0.247-0.871-0.412-0.871-0.722c0-0.361%2C0.352-0.635%2C0.836-0.635%20c0.335%2C0%2C0.612%2C0.134%2C0.906%2C0.462l0.583-0.764c-0.481-0.424-1.058-0.638-1.686-0.638c-1.016%2C0-1.791%2C0.707-1.791%2C1.642%20c0%2C0.794%2C0.36%2C1.197%2C1.411%2C1.579c0.439%2C0.153%2C0.662%2C0.257%2C0.776%2C0.328c0.224%2C0.145%2C0.335%2C0.352%2C0.335%2C0.592%20c0%2C0.467-0.37%2C0.811-0.871%2C0.811c-0.533%2C0-0.964-0.267-1.222-0.768l-0.722%2C0.7c0.516%2C0.756%2C1.135%2C1.094%2C1.988%2C1.094%20c1.163%2C0%2C1.982-0.778%2C1.982-1.887C16.757%2C24.202%2C16.377%2C23.788%2C15.102%2C23.322z%22%3E%3C/path%3E%20%3Cpath%20fill%3D%22%23444444%22%20d%3D%22M17.108%2C23.994c0%2C1.689%2C1.326%2C2.998%2C3.032%2C2.998c0.481%2C0%2C0.894-0.095%2C1.402-0.335v-1.32%20c-0.449%2C0.451-0.843%2C0.629-1.353%2C0.629c-1.128%2C0-1.927-0.816-1.927-1.98c0-1.1%2C0.825-1.972%2C1.877-1.972%20c0.531%2C0%2C0.937%2C0.188%2C1.402%2C0.646v-1.318c-0.491-0.248-0.894-0.351-1.379-0.351C18.467%2C20.991%2C17.108%2C22.325%2C17.108%2C23.994z%22%3E%3C/path%3E%20%3Cpolygon%20fill%3D%22%23444444%22%20points%3D%2230.617%2C24.977%2029.086%2C21.121%2027.864%2C21.121%2030.299%2C27.009%2030.9%2C27.009%2033.382%2C21.121%2032.17%2C21.121%20%22%3E%3C/polygon%3E%20%3Cpolygon%20fill%3D%22%23444444%22%20points%3D%2233.89%2C26.864%2037.066%2C26.864%2037.066%2C25.891%2035.011%2C25.891%2035.011%2C24.341%2036.988%2C24.341%2036.988%2C23.368%2035.011%2C23.368%2035.011%2C22.093%2037.066%2C22.093%2037.066%2C21.121%2033.89%2C21.121%20%22%3E%3C/polygon%3E%20%3Cpath%20fill%3D%22%23444444%22%20d%3D%22M41.5%2C22.815c0-1.076-0.738-1.695-2.031-1.695h-1.664v5.743h1.123v-2.309h0.146l1.547%2C2.309H42l-1.807-2.421%20C41.037%2C24.271%2C41.5%2C23.694%2C41.5%2C22.815z%20M39.254%2C23.762h-0.325v-1.737h0.343c0.7%2C0%2C1.075%2C0.294%2C1.075%2C0.853%20C40.347%2C23.452%2C39.972%2C23.762%2C39.254%2C23.762z%22%3E%3C/path%3E%3C/g%3E%3C/svg%3E"); }

.modal {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  padding-top: 200px;
  z-index: 100; 
  overflow-y: auto;
}
 .modal__container {
    display: flex;
    max-width: 675px;
    min-height: 400px;
    margin-bottom: 125px;
    background-color: #ffffff;
    border-radius: 5px;
    box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.15); }
  .modal__featured {
    position: relative;
    flex: 1;
    min-width: 130px;
    padding: 20px;
    overflow: hidden;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px; }
  .modal__circle {
    position: absolute;
    top: 0;
    left: 0;
    height: 200%;
    width: 200%;
    background-color: #fbcf34;
    border-radius: 50%;
    transform: translateX(-50%) translateY(-25%); }
  .modal__product {
    position: absolute;
    top: 0;
    left: 50%;
    max-width: 85%;
    transform: translateX(calc(-50% - 10px)); }
  .modal__content {
    flex: 3;
    padding: 40px 30px; }

/********************/
/* Luke Button客製 */
/********************/
.ll-pagination {
  display: flex;
}
.ll-pagination button {
  display: inline-block;
	font-size: 16px;
	padding: 12px 18px;
	color: #fff;
	background-color: #1293e8;
	border: 1px solid #8eb8ff;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}
.ll-pagination button:hover, .ll-pagination button:focus {
  background-color: #fff;
  color: #1293e8;
}
/* .ll-pagination button.pg-number { */
/*   border-radius: 0; */
/* } */
.ll-pagination button.pg-number:disabled {
  color: white;
  background-color: #0e5dff;
}
/* .ll-pagination button.pg-prev, .pagination button.pg-next { */
/*   border-radius: 0; */
/* } */
/* .ll-pagination button:first-child { */
/*   width: 2.5rem; */
/*   border-radius: 100px 0 0 100px; */
/* } */
/* .ll-pagination button:last-child { */
/*   width: 2.5rem; */
/*   border-radius: 0 100px 100px 0; */
/* } */
.ll-pagination button.pg-first:disabled, .pagination button.pg-last:disabled, .pagination button.pg-prev:disabled, .pagination button.pg-next:disabled {
  cursor: not-allowed;
}
.ll-pagination button + button {
  border-left: 0;
}






table.ll-table-sort { 
	border-collapse: collapse;
	width: 100%;  
	background-color: #eee;
	height: 300px;
	margin-top: 50px;
}

.ll-table-sort tr{
	border: solid 1px #ddd;
}

.ll-table-sort th a {
	-moz-box-sizing: border-box;
	-o-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	color: #efefef;
}

.ll-table-sort td,
.ll-table-sort th { 
	padding: 4px; 
	border: 1px solid #CCC;
	overflow: hidden;
	text-align: left;
	vertical-align: middle;
}
.ll-table-sort th { 
	background-color: #1293e8; 
	font-weight: 700;
}

.ll-table-sort th a,
.ll-table-sort td a { 
	display: block;
	width: 100%;
}
th a.sort-by { 
	padding-right: 18px;
	position: relative;
}
a.sort-by:before, a.sort-by:after {
	border: 5px solid transparent;
	content: "";
	display: block;
	height: 0;
	right: 5px;
	top: 50%;
	position: absolute;
	width: 0;
}
a.sort-by:before {
	border-bottom-color: #aaa;
	margin-top: -11px;
}
a.sort-by:after {
	border-top-color: #aaa;
	margin-top: 2px;
}


a.sort-by-active-top:before {
	border-bottom-color: #c2eefb;
	margin-top: -11px;
}
a.sort-by-active-top:after {
	border-top-color: #aaa;
	margin-top: 2px;

}

a.sort-by-active-bottom:before {
	border-bottom-color: #aaa;
	margin-top: -11px;
}
a.sort-by-active-bottom:after {
	border-top-color: #c2eefb;
	margin-top: 2px;
}

</style>

<body class="skin-blue">
	<div class="wrapper" style="background-color: #ECF0F5;">

		<header class="main-header" style="color: orange; height: 80px">
			<!-- Logo -->

			<a href="#" class="logo"
				style="width: 240px; height: 80px; margin: 0px; padding: 0px"><img
				src="<c:url value='/dist/img/luckycat.png'/>" class="img-circle"
				alt="logo" /><b> 滿滿大</b>後臺管理</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top"
				style="margin-left: 240px; height: 80px;" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"
					style="padding: 30px 0px; height: 80px; margin-right: 0px;"> <span
					class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Notifications: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu">
							<!--                             <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height:80px;margin:0px;padding:30px 20px"> -->
							<!--                                 <i class="fa fa-bell-o"></i> -->
							<!--                                 <span class="label label-warning" style="background:red">10</span> -->
							<!--                             </a> -->
							<ul class="dropdown-menu">
								<li class="header">You have 10 notifications</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li><a href="#"> <i class="fa fa-users text-aqua"></i>
												5 new members joined today
										</a></li>
										<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
												Very long description here that may not fit into the page
												and may cause design problems
										</a></li>
										<li><a href="#"> <i class="fa fa-users text-red"></i>
												5 new members joined
										</a></li>

										<li><a href="#"> <i
												class="fa fa-shopping-cart text-green"></i> 25 sales made
										</a></li>
										<li><a href="#"> <i class="fa fa-user text-red"></i>
												You changed your username
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul>
						</li>
						<!-- Tasks: style can be found in dropdown.less -->

						<!-- User Account: style can be found in dropdown.less -->
						<ul class="nav navbar-nav navbar-right"></ul>
						<li class="dropdown">
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#"><i class="fa fa-book fa-fw"
										aria-hidden="true"></i>你的帳號</a></li>
								<li role="separator" class="divider"></li>

								<li class="dropdown-header">Help</li>

								<li><a href="#" target="_blank"><i
										class="fa fa-long-arrow-left fa-fw" aria-hidden="true"></i>聯絡我們</a></li>
							</ul>
						</li>
						<li><a href="<c:url value='/admin/logout' />"><i
								class="fa fa-sign-out fa-3x"></i></a></li>
					</ul>


				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<div class="main-sidebar col-md-2"
			style="background: #222d32; width: 200px; height: 800px; border: 0px; position: relative;">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li></li>
					<li><a href="<c:url value='/admin/memberManage' />"> <i
							class="fa fa-th"></i> <span>會員管理</span>
					</a></li>
<!-- 					<li class="treeview"><a -->
<%-- 						href="<c:url value='/admin/companyManage' />"> <i --%>
<!-- 							class="fa fa-check-square-o"></i> <span>廠商管理</span> -->
<!-- 					</a></li> -->

				</ul>
			</section>
			<!-- /.sidebar -->
		</div>

		<!-- Cart view section -->


		<div class="container col-md-8" style="margin:50px;" >
				<div class="col-xs-12 text-center">
					<h4>會員管理</h4>
					<hr>
					<div id="containerll" class="text-center">
						
						<div class="row text-center">
							<div class="col-md-12 ">
								<form:form id="Form" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/member/insertCreditCard">
									<ul class="form-list">

										<li class="form-list__row"><label>姓名</label>
											<div id="" class="icon-search">
												<input type="text" v-model="pageSettings.keywordFullname"
													required="" />
											</div></li>
											<li class="form-list__row"><label>電子信箱</label>
											<div id="" class="icon-search">
												<input type="text" v-model="pageSettings.keywordEmail"
													required="" />
											</div></li>
											<li class="form-list__row"><label>身分證</label>
											<div id="" class="icon-search">
												<input type="text" v-model="pageSettings.keywordQid"
													required="" />
											</div></li>
<!-- 										<li class="form-list__row"><label>身分</label> -->
<!-- 											<div id="input--cc" class="creditcard-icon"> -->
<!-- 												<input type="text" name="CardNo" required="" /> -->
<!-- 											</div></li> -->
<!-- 										<li class="form-list__row form-list__row--agree"> -->

											

										</li>
									</ul>
									<hr>
									<button type="submit" class="ll-primary-btn" @click="updateDomSearch" >搜尋</button><br><br>
								</form:form>
							</div>

						</div>
						<div class="row" >
						<div id="MsgDiv" class="alert alert-info" style="font-size:16px;">
							<strong id="MsgLabel">XXX:</strong><br> <span id="Msg">xxx</span>
						</div>
					</div>
						<!-- 				<button @click="toggleTabs">Toggle</button> -->
						<!-- 				<div v-if="showmember"> -->
						<table id="" class="ll-table-sort col-md-12 text-center">
							<tr>
								<th @click="sortData('id')" ><a id="th_id" href="#" class="sort-by sort-by-active-bottom" >Id</a></th>
								<th @click="sortData('fullname')" ><a id="th_fullname" href="#" class="sort-by " >姓名</a></th>
								<th @click="sortData('qid')" ><a id="th_qid" href="#" class="sort-by" >身分證</a></th>
								<th @click="sortData('email')" ><a id="th_email" href="#" class="sort-by" >電子郵件</a></th>
								<th @click="sortData('active')" ><a id="th_active" href="#" class="sort-by" >帳號狀態</a></th>
								<th @click="sortData('createdDate')" ><a id="th_createdDate" href="#" class="sort-by" >註冊日期</a></th>
								<th></th>
							</tr>
							<tr v-for="(member, index) in memberList"
								v-if="index >= pageSettings.sIndex && index <= pageSettings.eIndex">
								<td>{{member[0]}}</td>
								<td>{{member[1]}}</td>
								<td>{{member[2]}}</td>
								<td>{{member[3]}}</td>
								<td>{{(member[4]=='true') ? '已啟用':'已停用' }}</td>
								<td>{{member[5]}}</td>
								<td><button :id="member[0]" @click="updateStatus" class="updateStatusButton ll-danger-btn" style="padding:7px;" :data-id="member[0].toString()" :data-active="member[4]" >{{(member[4]=='true') ? '停用':'啟用' }} </button></td>
							</tr>
						</table>
						
					<div class="row"></div>
					
					<div class="row" style="padding:20px;">
							<div class="col-md-4">
								<div style="margin-top:3px;">
									<label class="ll-label-large" >每頁顯示</label>
									<select v-model="pageSettings.rowsPerPage" @change="updateDom" style="height: 30px; width:70px; ">
										<option value="10" selected>10</option>
										<option value="15">15</option>
										<option value="20">20</option>
									</select><label class="ll-label-large">筆</label>
								</div>
							</div>
							<div class="col-md-6">
								<paginationll class="col-md-12" :data-list="memberList" :num-of-page-displayed="4"
						    :total-count="pageSettings.memberCount" 
							:rows-per-page="pageSettings.rowsPerPage"
							:current-page="pageSettings.currentPage"
							v-on:update-page="onPageChanged"></paginationll>
							</div>
							<div class="col-md-2" ><label class="ll-label-large" >總共有<b style="color:#337ab7; font-size:18px; ">{{pageSettings.memberCount}}</b>筆</label></div>
						</div>
						
					</div>


				</div>

		</div>


	</div>

   		

        <!-- Right side column. Contains the navbar and content of the page -->

        <!-- /.content-wrapper -->

    <!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='<c:url value='/plugins/fastclick/fastclick.min.js'/>'></script>
    <!-- AdminLTE App -->
    <script src="<c:url value='/dist/js/app.min.js'/>" type="text/javascript"></script>
    <!-- Sparkline -->
    
    
     <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.3.4/vue.min.js'></script>

      <script>
      
      
var memberList = [{ id: 1, name: 'test1' },
{ id: 2, name: 'test2' },
{ id: 3, name: 'test3' },
{ id: 4, name: 'test4' },
{ id: 5, name: 'test5' },
{ id: 6, name: 'test6' },
{ id: 7, name: 'test7' },
{ id: 8, name: 'test8' },
{ id: 9, name: 'test9' },
{ id: 10, name: 'test10' },
{ id: 7, name: 'test7' },
{ id: 8, name: 'test8' },
{ id: 9, name: 'test9' },
{ id: 10, name: 'test10' },
{ id: 7, name: 'test7' },
{ id: 8, name: 'test8' },
{ id: 9, name: 'test9' },
{ id: 10, name: 'test10' },
{ id: 7, name: 'test7' },
{ id: 8, name: 'test8' },
{ id: 9, name: 'test9' },
{ id: 10, name: 'test10' },
{ id: 7, name: 'test7' },
{ id: 8, name: 'test8' },
{ id: 9, name: 'test9' },
{ id: 10, name: 'test10' },
{ id: 7, name: 'test7' },
{ id: 8, name: 'test8' },
{ id: 9, name: 'test9' },
{ id: 10, name: 'test10' },
{ id: 7, name: 'test7' },
{ id: 8, name: 'test8' },
{ id: 9, name: 'test9' },
{ id: 10, name: 'test10' }],
employeeList = [{ id: 1, name: 'e1' },
{ id: 2, name: 'e2' },
{ id: 3, name: 'e3' },
{ id: 4, name: 'e4' },
{ id: 5, name: 'e5' },
{ id: 6, name: 'e6' },
{ id: 7, name: 'e7' },
{ id: 8, name: 'e8' },
{ id: 9, name: 'e9' },
{ id: 10, name: 'e10' },
{ id: 11, name: 'e11' },
];






// **************************
// ******** Luke自訂 ********
// **************************
	Vue.component('paginationll', {
  template: "<div class=\"ll-pagination\"><button class=\"pg-first\" v-bind:disabled=\"currentPage == 1\" v-bind:value=\"1\" v-on:click=\"pageOnClick\"><<</button><button class=\"pg-prev\" v-bind:disabled=\"currentPage == 1\" v-bind:value=\"currentPage - 1\" v-on:click=\"pageOnClick\"><</button><template v-for=\"page in showPage\"><button class=\"pg-number\" v-bind:value=\"page\" v-bind:disabled=\"currentPage == page\" v-on:click=\"pageOnClick\">{{page}}</button>  </template><button class=\"pg-next\" v-bind:disabled=\"currentPage == totalPages\" v-bind:value=\"currentPage + 1\" v-on:click=\"pageOnClick\">></button><button class=\"pg-last\" v-bind:disabled=\"currentPage == totalPages\" v-bind:value=\"totalPages\" v-on:click=\"pageOnClick\">>></button></div>",
  props: ['dataList','totalCount', 'rowsPerPage', 'currentPage', 'numOfPageDisplayed'],
  data: function () {
    return {
      source: [],
      showPage: [] // 目前顯示之頁碼，ex:[1,2,3,4,5] 
    };
  },
  beforeCreate: function() { 
	  console.log("HTML DOM beforeCreate()... ");
  },
  beforeMount: function() {
	  console.log("HTML DOM beforeMount()... ");
  },
  mounted() {
    this.source = this.dataList;
    
	    //取得會員總數
	    console.log("HTML DOM mounted()... ");
		fetch("<c:url value='/admin/getMemberTotalCount' />")
	   .then(async response => {
	   	data = await response.json();
	
	     // check for error response
	     if (!response.ok) {
	       // get error message from body or default to response statusText
	       const error = (data && data.message) || response.statusText;
	       return Promise.reject(error);
	     }
		
	     //this.totalCount = data;
	     console.log("fetching totalCount...totalCounts: "+ this.totalCount);
	     
	   })
	   .catch(error => {
	     this.errorMessage = error;
	     console.error("There was an error!", error);
	   });
    
  },
  watch: {
    dataList: function (newVal, oldVal) {
    	console.log("Pagination - watch (dataList) is changing.... " + this.totalCount);
      this.computeShowPage(this.totalPages);
      this.source = newVal;
      this.generateShowPage(this.currentPage);
     }
//  		,
//     'totalCount': {
// 	      immediate: true,
// 	      handler: function () {
// 	        console.log("Pagination - watch (totalCount) is changing.... " + this.totalCount);
	        
// 	        console.log("Pagination - watch (totalCount) page: "+ 1 + ", currentPage:" + this.currentPage + ", totalPages:" + this.totalPages);
// 	        if(this.currentPage==1){
// 	        	//this.generateShowPage(this.currentPage);
// 	        }
// 	  	}
//    }
  
  },

  methods: {
    pageOnClick: function (evt) {
    	console.log("Pagination - methods (pageOnClick) page: "+Number(evt.target.getAttribute('value')) + ", currentPage:" + this.currentPage + ", totalPages:" + this.totalPages);
    	this.generateShowPage(Number(evt.target.getAttribute('value')));
//      var page = Number(evt.target.getAttribute('value')),
//       currentPage = this.currentPage,
//       totalPages = this.totalPages,
//       numOfPageDisplayed = this.numOfPageDisplayed;
//       console.log("Pagination - methods (pageOnClick) page: "+page + ", currentPage:" + currentPage + ", totalPages:" + totalPages);
//       this.$emit('update-page', page);

//       if (totalPages <= numOfPageDisplayed) return;
//       // 重新計算並產生showPage陣列
//       var sPage, ePage;
//       sPage = page - Math.ceil(numOfPageDisplayed / 2) + 1;
//       ePage = sPage + numOfPageDisplayed - 1;
// 	  //console.log("sPage: "+sPage + ", ePage:" + ePage);
//       if (sPage < 1) {
//         sPage = 1;
//         ePage = numOfPageDisplayed;
//       } else if (ePage > totalPages) {
//         sPage = totalPages - numOfPageDisplayed + 1;
//         ePage = totalPages;
//       }
//       console.log("Pagination - methods (pageOnClick) sPage: "+sPage + ", ePage:" + ePage);
//       this.showPage = this.generateShowPageArray(sPage, ePage).slice();
    },
    // 給定起始和結束數字，產生數字陣列
    generateShowPageArray: function (sPage, ePage) {
      var ary = [];
      for (var i = sPage; i <= ePage; i++) {if (window.CP.shouldStopExecution(0)) break;
        ary.push(i);
      }window.CP.exitedLoop(0);
      return ary;
    },
    // 初始化頁碼 showPage
    computeShowPage: function (totalPages) {
      // 初始化頁碼 showPage
      //console.log("Pagination - 初始化頁碼 showPage : "+sPage + ", ePage:" + ePage);
      var count = 1,
      showPage = [];
      while (count <= totalPages && count <= this.numOfPageDisplayed) {if (window.CP.shouldStopExecution(1)) break;
        showPage.push(count);
        count++;
      }window.CP.exitedLoop(1);
      return showPage;
    }
    ,
    // 產出Pagination
    generateShowPage: function (page) {
    	//var page = Number(evt.target.getAttribute('value')),
        currentPage = this.currentPage,
        totalPages = this.totalPages,
        totalPages = Math.ceil(this.totalCount / this.rowsPerPage);
        numOfPageDisplayed = this.numOfPageDisplayed;
        console.log("Pagination - methods (generateShowPage) page: "+page + ", currentPage:" + currentPage + ", totalPages:" + totalPages);
        this.$emit('update-page', page);

        if (totalPages <= numOfPageDisplayed) return;
        // 重新計算並產生showPage陣列
        var sPage, ePage;
        sPage = page - Math.ceil(numOfPageDisplayed / 2) + 1;
        ePage = sPage + numOfPageDisplayed - 1;
  	  //console.log("sPage: "+sPage + ", ePage:" + ePage);
        if (sPage < 1) {
          sPage = 1;
          ePage = numOfPageDisplayed;
        } else if (ePage > totalPages) {
          sPage = totalPages - numOfPageDisplayed + 1;
          ePage = totalPages;
        }
        console.log("Pagination - methods (generateShowPage) sPage: "+sPage + ", ePage:" + ePage);
        this.showPage = this.generateShowPageArray(sPage, ePage).slice();
    }
  },

  computed: {
    // 總筆數
    totalRows: function () {
      //return this.source.length || 0;
      	console.log("initialize totalRows:... ");
    	return this.totalCount || 0;
    },
    // 總頁數
    totalPages: function () {
    		console.log("initialize totalPages:... ");
  		 
  	      //var total = Math.ceil(this.source.length / this.rowsPerPage);
	      var total = Math.ceil(this.totalCount / this.rowsPerPage);
	      this.showPage = this.computeShowPage(total);
	      console.log("total page: " + total + "( "+this.totalCount+" / "+this.rowsPerPage+" )");
      return total;
    } } });
    
    
	let columnName= '';
	let sortASC= true;
	
	var vm = new Vue({
		  el: '#containerll',
		  data: {
		    memberList: [],
		    employeeList: employeeList,
		    showmember: 1,
		    pageSettings: {
		      numOfPageDisplayed: 7,
		      currentPage: 1,
		      rowsPerPage: 10,
		      keywordFullname: '',
		      keywordEmail: '',
		      keywordQid: '',
		      memberCount: 100,
		      sIndex: 0, // 當前頁面起始資料index
		      eIndex: 0 // 當前頁面最末筆資料index
		    } },
		    mounted() {
		        //fetch("https://api.npms.io/v2/search?q=vue")
		        this.getMembers();
		      },
		  updated() {
			  console.log('vue updated...');
			  $("button:contains('啟')").removeClass('ll-danger-btn').addClass('ll-primary-btn');
		  },
		  watch: {
		    'pageSettings.currentPage': {
		      immediate: true,
		      handler: function () {
		        this.refreshDisplayIndex();
		        this.getMembers();
		        console.log("watching pageSettings.currentPage: " + this.pageSettings.currentPage);
		      } },
		    'pageSettings.rowsPerPage': {
			  immediate: true,
			  handler: function () {
				this.pageSettings.currentPage = 1;
			    this.refreshDisplayIndex();
			    this.getMembers();
			    console.log("watching pageSettings.rowsPerPage: " + this.pageSettings.currentPage);
			    
			  } },
			  'pageSettings.keywordFullname': {
				  immediate: true,
				  handler: function () {
				    console.log("watching pageSettings.keywordFullname: " + this.pageSettings.keywordFullname);
			  } },
			  'pageSettings.keywordEmail': {
				  immediate: true,
				  handler: function () {
				    console.log("watching pageSettings.keywordEmail: " + this.pageSettings.keywordEmail);
			  } },
			  'pageSettings.keywordQid': {
				  immediate: true,
				  handler: function () {
				    console.log("watching pageSettings.keywordQid: " + this.pageSettings.keywordQid);
			  } },
			      
		    showmember: function () {
		      this.pageSettings.currentPage = 1;
		    } },

		  methods: {
		    refreshDisplayIndex: function () {
		      this.pageSettings.sIndex = (this.pageSettings.currentPage - 1) * this.pageSettings.rowsPerPage;
		      this.pageSettings.eIndex = this.pageSettings.currentPage * this.pageSettings.rowsPerPage - 1;
		    },
		    onPageChanged: function (page) {
		      this.pageSettings.currentPage = page;
		    },
		    toggleTabs: function () {
		      this.showmember = !this.showmember;
		    } ,
		    updateDom: function () {
		    	this.getMembers();
			} ,
			updateDomSearch: function () {
				this.pageSettings.currentPage = 1;
		    	this.getMembers();
			} ,
			sortData: function (colname) {
				this.pageSettings.currentPage = 1;

				if(columnName != colname){ sortASC = true; }
				else{ sortASC = !sortASC; }
				
				columnName = colname;
				console.log("sortData.... columnName=" + columnName +"("+colname+"), sortASC=" + sortASC);
				
				$(".ll-table-sort").find("a.sort-by").removeClass().addClass("sort-by");
				
				let thEle = $("#th_"+columnName);
				if(sortASC) thEle.removeClass().addClass("sort-by sort-by-active-bottom");
				else thEle.removeClass().addClass("sort-by sort-by-active-top");
				
				
				
				
		    	this.getMembers();
			} ,
			// 帳號上下架
			updateStatus: function (event) {
				let msgDiv = $("#MsgDiv");
				let msgLabel = $("#MsgLabel");
				let msg = $("#Msg");
				
				//點擊button
				let clickedBtn = $("#"+event.currentTarget.id);
				console.log(clickedBtn);
				console.log("clickedBtn: " + clickedBtn.attr("id") + ", clickedBtn.data('active')=" +clickedBtn.data("active"));
				
				var updatestatus;
				if (clickedBtn.data("active")) updatestatus = false;
				else updatestatus = true;
				
				console.log("updatestatus:" + updatestatus );
				$.ajax({
					type: "GET",
					url: "/proj/admin/updateStatus?memberId="+ clickedBtn.attr("id") +"&status=" + updatestatus,
					//data: { "memberId": 5, "status" : true },
					success:function(data){
						console.log("AJAX success: "+data);
						//可增加動態處理
						// ....
						
						msgDiv.html("更新會員帳號狀態成功");
				    	msgDiv.removeClass().addClass("alert alert-info").show();
				    	// 若原本為已啟用變為停用
				    	if(clickedBtn.html() == '啟用'){
				    		clickedBtn.removeClass('ll-primary-btn').addClass('ll-danger-btn');
				    		clickedBtn.html('停用');
				    		console.log(clickedBtn.closest('tr'));
				    		clickedBtn.closest('tr').find("td:contains('已停用')").show(1000).html('已啟用').show(1000);
				    	}
				    	else{
				    		clickedBtn.removeClass('ll-danger-btn').addClass('ll-primary-btn');
				    		clickedBtn.html('啟用');
				    		clickedBtn.closest('tr').find("td:contains('已啟用')").show(1000).html('已停用').show(1000);
				    	}
					},
					error: function(xhr, status, error){
				    	var errorMessage = "[Error-"+  xhr.status+"]\r\n" + xhr.statusText + ': ' + xhr.responseText
				    	console.log(errorMessage);
				    	msgDiv.html("更新會員帳號狀態失敗(status:" +  xhr.status + ")");
				    	msgDiv.removeClass().addClass("alert alert-danger").show();
				    	
				    }
					
					
				});
			} ,
			
		    async getMembers(){
		        const res = await fetch("<c:url value='/admin/getMemberList?page="+this.pageSettings.currentPage+"&pageSize= "+this.pageSettings.rowsPerPage+"&keywordFullname= "+this.pageSettings.keywordFullname+"&keywordEmail= "+this.pageSettings.keywordEmail+"&keywordQid= "+this.pageSettings.keywordQid+"&columnName= "+ columnName +"&sortASC= "+sortASC+"' />");
		        console.log("executing vue...page: "+ this.pageSettings.currentPage +", rowsPerPage: "+ this.pageSettings.rowsPerPage+", keywordFullname: "+ this.pageSettings.keywordFullname+", keywordEmail: "+ this.pageSettings.keywordEmail+", keywordQid: "+ this.pageSettings.keywordQid+", columnName= "+ columnName +", sortASC= "+sortASC);
		        const data = await res.json();
		        //await new Promise(r => setTimeout(r, 2000));

		        console.log(data.Members);
		        for(i = 0 ;i< data.Members.length; i++){
		        	let member = data.Members[i];
		        	
		        	if(member[4]) {
		        		member[4] = 'true'}
		        	else {
		        		member[4] = 'false';}
		        	console.log("member[4]: "+ member[4]);
		        	
		        }
		        //
		        this.memberList = data.Members;
		        this.pageSettings.memberCount = data.TotalCount;
		      }  
		  } });
	

	//vm.$forceUpdate();
	
// page = 2;
// pageSize= 10;
// 	vm.$mount('#containerll');
	
// 	vm.$forceUpdate();
	
	$(document).ready(function() {
		  let msgDiv = $("#MsgDiv");
    	  msgDiv.hide();
    	  console.log("jquery running..");
    	 
	  	  
	  	$("#AAA").click(function(){
	  	
	  	});
	  	  
	  	function updateStatus(){
	    	  
	    }
      });
	
	
    </script>
</body>

</html>