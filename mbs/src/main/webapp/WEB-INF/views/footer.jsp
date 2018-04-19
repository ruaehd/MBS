<script src="resources/js/classie.js"></script>
      <script src="resources/js/gnmenu.js"></script>
      
      
      <script>
         new gnMenu( document.getElementById( 'gn-menu' ) );
      </script>
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script>
         $(function(){
            $('.sub_1').hide();
            $('.sub_2').hide();
            $('.sub_3').hide();
            $('.sub_main1').click(function(){
               $('.sub_1').toggle(500);
            });
            $('.sub_main2').click(function(){
               $('.sub_2').toggle(500);
            });
            $('.sub_main3').click(function(){
               $('.sub_3').toggle(500);
            });
            
            
         });
      </script>
   </body>
</html>
</body>
</html>