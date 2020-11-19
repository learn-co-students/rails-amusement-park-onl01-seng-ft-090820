<%= button_to 'ride', {:controller => "users", :action => "ride", :attraction_id => @attraction.id, :user_id=> current_user.id,}, {:method=>:post}  %>


  <%= link_to("Go on this ride", user_path(@user), method :patch) %>


  <form action="users/<%= @user.id %>/update" method="patch">
    <input type="submit" name="update" value="Go on this ride" />
</form>


 -- this works but does not capture the attraction id <%= link_to 'Go on this ride', ride_path(@user), method: :post %>  


<%= button_to [:ride] do %>
    Go on this ride
    <% end  %>


    <ul>

Name: <%= attraction.name  %>
Tickets: <%= attraction.tickets %>
Nausea Rating: <%= attraction.nausea_rating %>
Happiness Rating: <%= attraction.happiness_rating %>
</ul>
<% end %>