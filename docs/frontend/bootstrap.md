# Bootstrap

## What is Bootstrap?

- An external CSS layout system
    - Top 3 CSS Frameworks: [Bootstrap](https://getbootstrap.com/), [Foundation](https://get.foundation/), and [Animate](https://animate.style/)
- Provides premade components and styling

## Pros

- Easy and quick to build pages
- Broswer compatibility
    - Each component is tested before release

## Downsights

- Class bloat: a lot of styling ends up in the HTML file (less clean)
- Customization: may not allow designing exactly as you want

## How to use Bootstrap?

### Include via CDN (Content Delivery Network) Link

Example with the [card component](https://getbootstrap.com/docs/5.3/components/card/):

```html
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
```

```html
<body>
  <div class="flex-container">
    <div class="card" style="width: 18rem;">
      <img src="./flower.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
        <a href="https://www.google.com" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div>
</body>
```
