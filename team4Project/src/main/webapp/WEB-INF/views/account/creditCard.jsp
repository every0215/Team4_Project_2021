<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel='stylesheet' href='https://cdn.datatables.net/responsive/1.0.4/css/dataTables.responsive.css'>

  <style >
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
  margin: 0;
  font-weight: 600; }


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
  </style>
  
  <body> 
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-7f4d47902dc785f30dedcac9c996b9f31d4dfcc33567cc48f0431bc918c2bf05.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-bb9a2ba1f03f6147732cb3cd52ac86c6b24524aa87a05ed0b726f11e46d7e277.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
  
  
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->

	<c:import url="/layout/header" />

  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
    <img src="<c:url value='/img/fashion/fashion-header-bg-8.jpg' />" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Account Page</h2>
        <ol class="breadcrumb">
          <li><a href="index.html">Home</a></li>                   
          <li class="active">Account</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="aa-myaccount">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="aa-myaccount-area">         
            <div class="row">
                <div class="nav-side-menu col-md-2">
			    	<c:import url="/layout/accountMenu" />
				</div>
				<div class="container col-md-10">
				  <div class="row">
				    <div class="col-xs-8">
				       <h4>信用卡管理</h4>
				      <div class="modal__container">
<!-- 					      <div class="modal__featured"> -->
<!-- 					        <button type="button" class="ll-button-transparent ll-button-close"> -->
<!-- 					          <svg class="nc-icon glyph" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32"> -->
<!-- 					            <g><path fill="#ffffff" d="M1.293,15.293L11,5.586L12.414,7l-8,8H31v2H4.414l8,8L11,26.414l-9.707-9.707 C0.902,16.316,0.902,15.684,1.293,15.293z"></path> </g></svg> -->
<!-- 					          <span class="visuallyhidden">Return to Product Page</span> -->
<!-- 					        </button> -->
<!-- 					        <div class="modal__circle"></div> -->
<!-- 					        <img src="https://cloud.githubusercontent.com/assets/3484527/19622568/9c972d44-987a-11e6-9dcc-93d496ef408f.png" class="modal__product" /> -->
<!-- 					      </div> -->
					      <div class="modal__content">
					        <form:form id="Form" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/member/insertCreditCard" modelAttribute="memberCreditCard" enctype='multipart/form-data'>
					          <ul class="form-list">
					            <li class="form-list__row">
					              <label>姓名</label>
					              <input type="text" name="OwnerName" required="" />
					            </li>
					            <li class="form-list__row">
					              <label>信用卡卡號</label>
					              <div id="input--cc" class="creditcard-icon">
					                <input type="text" name="CardNo" required="" />
					              </div>
					            </li>
					            <li class="form-list__row form-list__row--inline">
					              <div>
					                <label>信用卡到期日</label>
					                <div class="form-list__input-inline">
					                  <input type="text" name="ExpireDateMM" placeholder="MM"  pattern="[0-9]{2}" minlength="2" maxlength="2" required="" />
					                  <input type="text" name="ExpireDateYY" placeholder="YY"  pattern="[0-9]{2}" minlength="2" maxlength="2" required="" />
					                </div>
					              </div>
					              <div>
					                <label>
					                  CVV
					                  <a href="#cvv-modal" class="ll-button-transparent modal-open ll-button-info">
					                    <svg class="nc-icon glyph" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16"><g> <path fill="#35a4fb" d="M8,0C3.6,0,0,3.6,0,8s3.6,8,8,8s8-3.6,8-8S12.4,0,8,0z M8,13c-0.6,0-1-0.4-1-1c0-0.6,0.4-1,1-1s1,0.4,1,1 C9,12.6,8.6,13,8,13z M9.5,8.4C9,8.7,9,8.8,9,9v1H7V9c0-1.3,0.8-1.9,1.4-2.3C8.9,6.4,9,6.3,9,6c0-0.6-0.4-1-1-1 C7.6,5,7.3,5.2,7.1,5.5L6.6,6.4l-1.7-1l0.5-0.9C5.9,3.6,6.9,3,8,3c1.7,0,3,1.3,3,3C11,7.4,10.1,8,9.5,8.4z"></path> </g></svg>
					                    <span class="visuallyhidden">What is CVV?</span>
					                  </a>
					                </label>
					                <input type="text" name="CVV" placeholder="123" pattern="[0-9]{3}" minlength="3" maxlength="4" required="" />
					              </div>
					            </li>
					            <li class="form-list__row form-list__row--agree">
	               					
						             	<div id="MsgDiv" class="alert alert-info"><strong id="MsgLabel">XXX:</strong><br>
						             		<span id="Msg">xxx</span>
						             	</div>
	               					
					            </li>
					            <li>
					              <button type="submit" id="insertbutton" class="ll-button"><b>新增信用卡</b></button>
					              <button type="submit" id="oneclickbutton" class="ll-button ll-button-grey"><b>一鍵輸入</b></button>
					            </li>
					          </ul>
					        </form:form>
					      </div> <!-- END: .modal__content -->
					    </div> <!-- END: .modal__container -->
				    </div>
				     <div class="col-xs-4">
				     	<div id="memberCreditCardListDiv" >
<!-- 					<div class="row" style="border: solid 1px #ffa200;padding:5px;background-color:#fff5df;"> -->
<!-- 				    	<div class="col-xs-12"> -->
<!-- 				    		<div id="input--cc" class="creditcard-icon"> -->
<!-- 					                <input type="text" name="cc_number" required="" value="12XX-XXXX-XXXX-XX01" disabled> -->
<!-- 					        </div> -->
				    	 
<!-- 				    	</div> -->
<!-- 				    	<div  class="col-xs-6"> -->
				    		
<!-- 				    	</div> -->
<!-- 				    	<div  class="col-xs-6"> -->
<!-- 				    		<button type="submit" class="ll-button ll-button-primary editbutton"><b>更新</b></button> -->
<!-- 				    		<button type="submit" class="ll-button ll-button-danger deletebutton"><b>刪除</b></button> -->
<!-- 				    	</div> -->
<!-- 				   	</div> -->
            		</div>
				     </div>
				  </div>
				</div>
				
            </div>          
         </div>
       </div>
     </div>
   </div>
 </section>
 
 

 <!-- / Cart view section -->

  <!-- footer -->  
  <footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
     <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-top-area">
            <div class="row">
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <h3>Main Menu</h3>
                  <ul class="aa-footer-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Our Services</a></li>
                    <li><a href="#">Our Products</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Knowledge Base</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">Delivery</a></li>
                      <li><a href="#">Returns</a></li>
                      <li><a href="#">Services</a></li>
                      <li><a href="#">Discount</a></li>
                      <li><a href="#">Special Offer</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Useful Links</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">Site Map</a></li>
                      <li><a href="#">Search</a></li>
                      <li><a href="#">Advanced Search</a></li>
                      <li><a href="#">Suppliers</a></li>
                      <li><a href="#">FAQ</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Contact Us</h3>
                    <address>
                      <p> 25 Astor Pl, NY 10003, USA</p>
                      <p><span class="fa fa-phone"></span>+1 212-982-4589</p>
                      <p><span class="fa fa-envelope"></span>dailyshop@gmail.com</p>
                    </address>
                    <div class="aa-footer-social">
                      <a href="#"><span class="fa fa-facebook"></span></a>
                      <a href="#"><span class="fa fa-twitter"></span></a>
                      <a href="#"><span class="fa fa-google-plus"></span></a>
                      <a href="#"><span class="fa fa-youtube"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
    </div>
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
      <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-bottom-area">
            <p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
            <div class="aa-footer-payment">
              <span class="fa fa-cc-mastercard"></span>
              <span class="fa fa-cc-visa"></span>
              <span class="fa fa-paypal"></span>
              <span class="fa fa-cc-discover"></span>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </footer>
  <!-- / footer -->

 

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<c:url value='/js/bootstrap.js' />"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.js' />"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.bootstrap.js' />"></script>  
  <!-- To Slider JS -->
  <script src="<c:url value='/js/sequence.js' />"></script>
  <script src="<c:url value='/js/sequence-theme.modern-slide-in.js' />"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="<c:url value='/js/jquery.simpleGallery.js' />"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery.simpleLens.js' />"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="<c:url value='/js/slick.js' />"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="<c:url value='/js/nouislider.js' />"></script>
  <!-- Custom js -->
  <script src="<c:url value='/js/custom.js' />"></script> 
  
  <script src="<c:url value='/js/luke_js.js' />"></script> 
  
  <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
  <script  src="https://cdpn.io/cp/internal/boomboom/pen.js?key=pen.js-70199a3b-d922-2eff-4b6c-1b5626afc909" crossorigin></script>
  
  </body>
  

<script src='https://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js'></script>
<script src='https://cdn.datatables.net/responsive/1.0.4/js/dataTables.responsive.js'></script>
      <script id="rendered-js" >
      $(document).ready(function() {
    	  var msgDiv = $("#MsgDiv");
    	  var msgLabel = $("#MsgLabel");
    	  var msg = $("#Msg");
    	  msgDiv.hide();
    	  
    	  //新增信用卡成功
    	  <c:if test='${(verified != null)&&(verified== true)}'>
    	  		showMsg('成功訊息:','<c:out value="${msg}" />','alert-info');
    	  		//$("#Form")[0].reset();
		  </c:if>
		  //新增信用卡錯誤
		  <c:if test='${(verified != null)&&(verified== false)}'>
		  		showMsg('錯誤訊息:','<c:out value="${msg}" />','alert-danger');
	  	  </c:if>

	    	
    	  getMemberCreditCards();
   		//新增資料
//    		$(document).on(
// 				"click", "#insertbutton",
// 				function() {
// 					let thisObj = $(this);
					
// 						$.ajax({
// 							type: "POST",
// 							url: "<c:url value='/member/insertCreditCard' />",
// 							data: { memberId: id },
// 							success:function(data){
// 								console.log("success: "+data);
// 								console.log(thisObj);
								
// 								msgDiv.html("已成功刪除會員: " +  memberName);
// 								msgDiv.removeClass().addClass("alert alert-info").show();

// 							},
// 							error: function(xhr, status, error){
// 						    	var errorMessage = "[Error-"+  xhr.status+"]\r\n" + xhr.statusText + ': ' + xhr.responseText
// 						    	console.log(errorMessage);
// 						    	msgDiv.html("刪除會員發失敗(status:" +  xhr.status + ")");
// 						    	msgDiv.removeClass().addClass("alert alert-danger").show();
						    	
// 						    }
							
							
// 						});
// 						console.log('get delete memberid..');
// 						console.log($(this).id);
// 						console.log($(this).parent().siblings().eq(0));
// 						console.log($(this).parent().siblings().eq(0)
// 								.find("input:first").val());
// 						let memberId = $(this).parent().siblings()
// 								.eq(0).find("input:first").val();
// 						console.log("memberId: " + memberId);
// 						$("#memberId").val(memberId);
// 						$("#action").val("delete");
// 						//$("#RegisterForm").submit();
// 					}
// 				})
				
		
		
    	//刪除資料
		$(document).on(
				"click", ".deletebutton",
				function() {
					let thisObj = $(this);
					let id = $(this).data("id");
					let cardNo = $(this).data("cardno");
					let parentMsgDiv = thisObj.closest("div.row");
					console.log(thisObj.parents("div.row").html());
					var r = confirm("確定要刪除此筆信用卡資料: " + cardNo);
					if (r == true) {
						
						$.ajax({
							type: "POST",
							url: "<c:url value='/member/deleteCreditCard' />",
							data: { cardId: id },
							success:function(data){
								console.log("success: "+data);
								//可增加動態處理
								// ....
								parentMsgDiv.hide(1000);
								showMsg('成功訊息:','已成功刪除信用卡:'+ cardNo,'alert-info');

							},
							error: function(xhr, status, error){
						    	var errorMessage = "[Error-"+  xhr.status+"]\r\n" + xhr.statusText + ': ' + xhr.responseText
						    	console.log(errorMessage);
						    	showMsg('錯誤訊息:','刪除信用卡失敗:'+ cardNo,'alert-danger');
						    	
						    }
							
							
						});
						console.log('get delete memberid..');
						console.log($(this).id);
						console.log($(this).parent().siblings().eq(0));
						console.log($(this).parent().siblings().eq(0)
								.find("input:first").val());
						let memberId = $(this).parent().siblings()
								.eq(0).find("input:first").val();
						console.log("memberId: " + memberId);
						$("#memberId").val(memberId);
						$("#action").val("delete");
						//$("#RegisterForm").submit();
					}
				})
				
				
				$("#oneclickbutton").click(function(e){
					$("input[name='OwnerName']").val("luke");
					$("input[name='CardNo']").val("1111222233334444");
					$("input[name='ExpireDateMM']").val("01");
					$("input[name='ExpireDateYY']").val("22");
					$("input[name='CVV']").val("999");
					e.preventDefault();
				});
				
				function showMsg(s1, s2, classname){
		     	  var msgDiv = $("#MsgDiv");
		    	  var msgLabel = $("#MsgLabel");
		    	  var msg = $("#Msg");
		    	  msgLabel.html(s1);
		    	  msg.html(s2);
				  msgDiv.removeClass().addClass('alert '+classname).show();
      			}
      });
      
      function getMemberCreditCards(){
    	  let mcclistDiv = $("#memberCreditCardListDiv");
    	  $.ajax({
				type: "Get",
				url: "<c:url value='/member/getMemberCreditCards' />",
				//data: { memberId: id },
				success:function(data){
					console.log("success: "+data);
					//可增加動態處理
					// ....
					let htmlstr = '';
 					for(let i = 0; i<data.length;i++){
 			        	console.log("cardNo: " + data[i].cardNo);
 			        	htmlstr += '<div class="row" style="margin-top: 5px; border: solid 1px #ffa200;padding:5px;background-color:#fff5df;"><div class="col-xs-12"><div id="input--cc" class="creditcard-icon">';
	 			        htmlstr += '<input type="text" name="cc_number" required="" value="'+ data[i].cardNo+'" disabled>';
	 			        htmlstr += '</div></div><div  class="col-xs-8"></div><div  class="col-xs-4">';
	 			        htmlstr += '<button type="submit" class="ll-button ll-button-danger deletebutton" data-id="'+data[i].id+'" data-cardno="'+data[i].cardNo+'" ><b>刪除</b></button></div></div>';
 			        }
					mcclistDiv.append(htmlstr);
					

				},
				error: function(xhr, status, error){
			    	var errorMessage = "[Error-"+  xhr.status+"]\r\n" + xhr.statusText + ': ' + xhr.responseText
			    	console.log(errorMessage);
			    	msgDiv.html("取得信用卡清單失敗(status:" +  xhr.status + ")");
			    	msgDiv.removeClass().addClass("alert alert-danger").show();
			    	
			    }
				
				
			});
    	  
    	 
      }
      
      
     
      
    	</script>
</html>