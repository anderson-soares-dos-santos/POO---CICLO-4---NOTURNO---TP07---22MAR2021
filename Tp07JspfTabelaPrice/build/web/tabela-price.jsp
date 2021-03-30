<%-- 
    Document   : tabela price
    Created on : 28 de mar. de 2021, 19:57:17
    Author     : andersons
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
  
   double pmt=0;          //valor da prestação - pmt
   double i=0;           //valor da taxa de juros(% a.m) - i
   double n=0;           //periodo do financiamento (em meses) - n
   double a=0;           //amortização
   double Vp=0;          //Valor presente ou valor financiado
   double ValorJuros=0;    //Valor do juros
   double SaldoDevedor=0;    //Saldo devedor
   double ValorJurosAcumulaldo=0;    //Valor do juros acumulado
   double AmortizacaoT = 0;  //Totalizado final de amortização

   String errorMessage = null;
   try{
       
            
      //valor da prestação - pmt
      //pmt = Double.parseDouble(request.getParameter("pmt"));
      // VALOR PRESENTE OU VALOR FINANCIADO - Vp
      Vp = Double.parseDouble(request.getParameter("Vp"));
      //valor da taxa de juros(% a.m) - i
      i = Double.parseDouble(request.getParameter("i"));
      //tratando a taxa de juros de informada , para utilização nos calculos
      // i/100
      i = i/100;
      
      //periodo do financiamento (em meses) - n
      n = Double.parseDouble(request.getParameter("n"));
      //valor da prestação - pmt
      
      //pmt = Double.parseDouble(request.getParameter("pmt"));
       pmt = (( Vp * (( Math.pow((1+i),n) * i ) / ( Math.pow((1+i),n) -1 ))));
       //arredondando valor da parcela
      //pmt = Math.round((pmt*1000)/1000.0);
      //CALCULO DO valor dos juros
      //SALDO DEVEDOR * TAXA DE JUROS
      ValorJuros = (((Vp * i))) ;
      //CALCULO DA AMORTIZAÇÃO
      a =( pmt - ValorJuros) ;
     
     
      //CALCULO SALDO DEVEDOR
      //1º MES == >SALDO DEVEDOR = Vp - a
      SaldoDevedor = ((( Vp - a) ) );
      
      AmortizacaoT = a;
      ValorJurosAcumulaldo = ValorJuros;
      
      
                    
    }catch(Exception ex){
       errorMessage = "Erro na leitura dos parâmetro";
    
    }
   
%>

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
        <form action="tabela-price.jsp" id="form">  
           
            <p>VALOR FINANCIADO(R$): <input type="number" name="Vp"/></p>
            <!Para inserir numero quebrado , utilizar step>
            <p>TAXA DE JUROS(% a.m):  <input type="number" step=0.01 name="i"/>(%)</p>
            <p>PERÍODO(em meses):     <input type="number" step=0.01 name="n"/>(EM MESES)</p>
            <input type="submit"  value="CALCULAR" id="calcButton"/>
              
        </form>
         <section id="results">
                    <div id="section-break"></div>
                                                
                    <b><p>VALOR FINANCIADO(R$): <%= ((Vp * 100) / 100.0)%></p></b>
                    <b><p>TAXA DE JUROS(% a.m): <%= (i*100)%>%</p></b>
                    <b><p>QUANTIDADE DE PARCELAS: <%=(int) n%></p></b>
                    <b><p>AMORTIZAÇÃO PROGRESSIVA -SIMULAÇÃO COM VALORES ARREDONDADOS </p></b>
                    
                            <table id="tabela-resultados" border="5">
                                <tr>
                                    <th>No.</th>
                                    <th> VALOR DA PRESTAÇÃO</th>
                                    <th>VALOR DA AMORTIZAÇÃO</th>
                                    <th>VALOR DOS JUROS</th>
                                    <th>SALDO DEVEDOR</th>
                                </tr>
                                <%--Primeira linha --%>
         
                <tr>
                <td><%= 1 %></td>
                <td><%= Math.round((pmt *1000)/1000.0) %></td>
                <td><%= Math.round((a *1000)/1000.0)  %></td>
                <td><%=Math.round(((ValorJuros)*1000)/1000.0) %></td>
                <td><%=Math.round (((SaldoDevedor)*1000)/1000.0) %></td>
               
                        
             
             <%for(int j=2; j<=n; j++){%>
                <tr>
                <td><%= j %></td>
                <td><%= Math.round ((pmt*10000)/10000.0)  %></td>
                <td><%= a = Math.round(((pmt - (SaldoDevedor * i))*10000) /10000.0 ) %></td>
                <td><%= ValorJuros =Math.round(((SaldoDevedor * i)*10000 )/10000.0 ) %></td>
                <td><%= SaldoDevedor = Math.round(((SaldoDevedor - a)*10000)/10000.0) %></td>
              
            
          
            </tr>
            
            <%}%>
             
           
        </table>
                </section>       
        
        
        <%@include file="WEB-INF/jspf/footer.jspf"  %>
    </body>
</html>
