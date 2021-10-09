# claimazon

A new Flutter project.

**Motive**
To perform screening test

## Dependency used in this project

```
  cupertino_icons:
  flutter_icons:
  fluttericon:
  font_awesome_flutter:
  flutter_vector_icons:
  get:
  get_storage:
  shimmer:
  http:
  google_fonts:
  qr_flutter:
  cached_network_image:
  intl_phone_field: ^2.0.1
  flutter_rating_bar: ^4.0.0
```

## Fake API

To fake the behaviour of the API/Server response i used mockapi.io to show real effects

# Follow Up Questions

### How would you change the API in order to achieve a much better scalable and maintainable application.

- The Api seems batter approach but there can be update on Product Images, right now it's a single image we might have more than one images, i guess make image an array even for single image would be best approach.

- Regardless Images Product might have variants and each variant have different prices, I guess flipping the price from main object to a new perm as an array of variants even it have single variant would be helpful for future.

- I didn't got the idea for recommendations array but it seems we can merge into ratings.

### How do you assure that such a change will not change the code functionality of your MVP client?.

- Since the project structure is structured in a way to accept changes easily it would be very few changes on specific files, in such scenarios of we have breaking changes we usually follow API versioning technique to avoid app crash.
