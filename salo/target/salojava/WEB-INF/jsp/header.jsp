<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/3
  Time: ����2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" %>

<!-- Header -->

<header id="header">
  <img src="images2/logo.png" class="logo">
  <h1><a href="../../index.jsp">SALOTTO ɳ��</a></h1>
  <nav class="links">
    <ul>
      <li><a href="../../index.jsp">��ҳ</a></li>
      <li><a href="#">ͼ</a></li>
      <li><a href="#">�</a></li>
      <li><a href="#">��Ѷ</a></li>
      <li><a href="#">��̳</a></li>
      <li><a href="#">����</a></li>
    </ul>
  </nav>

  <nav class="main">
    <ul>
      <%
        User user = (User)session.getAttribute("user");
        if(user!=null){
      %>
      <li class="search">
        <a class="fa-search" href="#search">Search</a>
        <form id="search" method="get" action="#">
          <input type="text" name="query" placeholder="Search" />
        </form>
      </li>

      <li class="menu">
        <a class="fa-bars" href="#menu">�˵�</a>
      </li>
      <%
      }
      else{
      %>
      <li></li>
      <%
        }
      %>
    </ul>
  </nav>
</header>
<!-- Menu -->
<section id="menu">



  <!-- Links -->
  <section>
    <ul class="links">

      <li>
        <a href="#" >
          <div class="author" id="account"><img src="images2/avatar.jpg" alt="" /></div>
          <h3 class="bar">PUNO_</h3>

        </a>
        <a href="Exit" class="button" id="signout">�ǳ�</a>
      </li>



    </ul>
  </section>
  <section>
    <ul class="links">
      <li>
        <a href="#">
          <h3 >�ҵ���ҳ</h3>

        </a>
      </li>
      <li>
        <a href="#">
          <h3>�ҵ��ղ�</h3>

        </a>
      </li>
      <li>
        <a href="#">
          <h3>�ҵĺ���</h3>

        </a>
      </li>

    </ul>
  </section>
  <section>
    <ul class="links">
      <li>
        <a href="#">
          <h3 >�������</h3>

        </a>
      </li>
      <li>
        <a href="#">
          <h3>�ҵ�����</h3>

        </a>
      </li>
      <li>
        <a href="#">
          <h3>����</h3>

        </a>
      </li>

    </ul>
  </section>


</section>
