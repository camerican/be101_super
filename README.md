# Hero App

Hi Class, as promised, the code from today's class is now available in this Git repo.  A couple outstanding issues from class have been resolved:

## Fixing the heredoc HTML escaping

To get the *HEREDOC* to play nicely with us and not escape HTML characters, we can append it with the *raw* method.  As in:

```ruby
<%= raw <<-THISISAHEHEREDOC
	<p>I ate #{i} fish#{"es" if i>1} last night!</p>
	<p>You can try them at my favorite restaurant, the <a href="http://www.fishyfishycafe.com">Fishy Fish Cafe</a>. <small>Just kidding, I've never been there</small>.</p>
THISISAHEREDOC
%>
```

We put an example of this in the hero/index.html.erb as part of our detour.

## Setting up link_to for a particular record

We were able to cover using the rails helper method *link_to* in class to generate a link to the hero/index.html.erb that lives at the URL: /hero.  This was done as follows:

```ruby
link_to "Home", :hero_index
```
which generates the following html:

```html
<a href="/hero">Home</a>
```
Using the helper method is great since that will update if ever we change the routes. If we hard coded the html, we'd have to go back into our views and update that whenever the routes changed, which would be the opposite of fun.

You may be asking "Where does the :hero_index come from?"  Good question!  That's the "prefix" we have for our hero index route and it's specified in the routes file:

| Prefix | Verb | URI Pattern   |           Controller#Action |
| --- | --- | --- | --- |
| *hero_index* | GET |   /hero(.:format)    |      hero#index |

We didn't cover the link back to a specific record from the index to the show.  To do that we can invoke rails magic by appending _path to the end of the prefix we're looking to reference.  This will allow us to pass through a specific instance of the resource (in this case a Hero) so it loads the data in properly (and gets the :id it needs).

For the hero#show route, the prefix we want is simply "hero":

| Prefix | Verb | URI Pattern   |           Controller#Action |
| --- | --- | --- | --- |
| *hero* | GET |   /hero/:id(.:format)    |      hero#show |

Which means we can call the rails-generated helper method hero_path and pass it an instance of a particular hero.  It will automatically load the necessary query string data (in this case :id):

```ruby
<ol>
<% @heroes.each do |hero| %>
	<li><%= link_to hero.name, hero_path(hero) %></li>
<% end %>
</ol>
```

Note that we're loading each hero into the "hero" variable through the do |pipes| block -- each will load every hero into the "hero" variable one by one.  By passing that object into hero_path method, it's able to determine the correct path and render:

```html
<ol>
	<li><a href="/hero/1">Superman</a></li>
	<li><a href="/hero/2">Batman</a></li>
	<li><a href="/hero/3">The Thing</a></li>
</ol>
```

Had fun with you all this evening.  Enjoy Adam's class on Wednesday!

Also, this site will be hosted on [remotal.com/hero](http://remotal.com/hero) for another few days, if you'd like to check out what we did so far in a non-local environment.
