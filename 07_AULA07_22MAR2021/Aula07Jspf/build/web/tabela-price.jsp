<%-- 
    Document   : tabela-price
    Created on : 28 de mar. de 2021, 10:07:54
    Author     : andersons
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TABELA PRICE - JSPF </title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"  %>
        <h1>TABELA PRICE</h1>
        <h2>SISTEMA FRANCÊS DE AMORTIZAÇÕES</h2>
        </form>
        <form action="calcular-valor-financiado.jsp">  
            VALOR DA PRESTAÇÃO(R$): <input type="number" name="pmt"/><p> 
            <!Para inserir numero quebrado , utilizar step>
            TAXA DE JUROS(% a.m):  <input type="number"step=0.01 name="i"/>(%)<p>
            PERÍODO(em meses):     <input type="number" name="n"/>(EM MESES)<p>
            <input type="submit"  value="CALCULAR VALOR FINANCIADO"/>
              
        </form>
                
        
        
        <%@include file="WEB-INF/jspf/footer.jspf"  %>
    </body>
</html>

