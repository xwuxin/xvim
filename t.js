var fill;

fill = function(container, liquid) {
  if (liquid == null) liquid = "coffee";
  return "Filling the " + container + " with " + liquid + "...";
};

console.log(fill('con'));
