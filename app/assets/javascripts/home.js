ymaps.ready(init);

function init(){

  var map = new ymaps.Map("map", {
    center: [55.76, 37.64],
    zoom: 16,
    controls: ['zoomControl', 'typeSelector',  'fullscreenControl']
  }),
  objectManager = new ymaps.ObjectManager({
    // Чтобы метки начали кластеризоваться, выставляем опцию.
    clusterize: true,
    // ObjectManager принимает те же опции, что и кластеризатор.
    gridSize: 32,
    clusterDisableClickZoom: true
  });

  // Чтобы задать опции одиночным объектам и кластерам,
  // обратимся к дочерним коллекциям ObjectManager.
  objectManager.objects.options.set('preset', 'islands#greenDotIcon');
  objectManager.clusters.options.set('preset', 'islands#greenClusterIcons');
  map.geoObjects.add(objectManager);

  $.ajax({
    url: "https://api.myjson.com/bins/mfuzt"
  }).done(function(data) {
    objectManager.add(data);
  });
}