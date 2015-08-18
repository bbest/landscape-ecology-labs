
Consider:

* move "master" branch to "gh-pages" branch, otherwise every edit requires:

    ```bash
    git checkout gh-pages
    ```

* want some navigation, ease of updating markdown on the fly (eg prose.io) for in class labs with pretty tocify toc, and option to generate special html io slides with autoresize of images

  based on http://stackoverflow.com/questions/16904054/slidify-how-to-position-an-image
  
  ```markdown
  <!-- Limit image width and height -->
  <style type='text/css'>
  img {
      max-height: 560px;
      max-width: 964px;
  }
  </style>
  
  <!-- Center image on slide -->
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.min.js"></script>
  <script type='text/javascript'>
  $(function() {
      $("p:has(img)").addClass('centered');
  });
  </script>
  ```

- nice Rmarkdown formats with [tocify](http://gregfranko.com/jquery.tocify.js/)

   - https://github.com/juba/rmdformats

   - http://jimhester.github.io/knitrBootstrap/ - framework to create bootstrap styled HTML reports from knitr Rmarkdown ; uses [jquery tocify](http://gregfranko.com/jquery.tocify.js/) [examples](https://rawgit.com/jimhester/knitrBootstrap/master/inst/examples/all.html)

* [GitHub tip: easily sync your master to GitHub Pages - BrettTerpstra.com](http://brettterpstra.com/2012/09/26/github-tip-easily-sync-your-master-to-github-pages/)

* [Deploy to `gh-pages` from a `dist` folder on the master branch. Useful for use with [yeoman](http://yeoman.io).](https://gist.github.com/cobyism/4730490)

* [github pages as submodule](http://blog.blindgaenger.net/generate_github_pages_in_a_submodule.html)

* [morea pedagogical framework for courses with jekyll and github](http://morea-framework.github.io/)

- http://jekyllthemes.org/

Features:

- [kramdown toc](http://kramdown.gettalong.org/converter/html.html#toc)

    - [jekyll-table-of-contents](https://github.com/ghiculescu/jekyll-table-of-contents) - [eg](http://help.tanda.co/)
    
- [Get Started with GitHub Pages and Jekyll](http://24ways.org/2013/get-started-with-github-pages/)
- [jekyll bootstrap](http://jekyllbootstrap.com/usage/jekyll-quick-start.html)
- [Jekyll Themes](http://jekyllthemes.org/)