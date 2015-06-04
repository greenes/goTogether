var Accommodation = function(){
  this.hearts = $('#piece-hearts').val();
  this.gallery = $('#piece-gallery').val();
  this.artist = $('#piece-artist').val();
  this.id = $('#piece-id').val();
}

Piece.prototype = {

  heart: function(){
    this.hearts = parseInt(this.hearts) + 1;
  },

  get: function(){
    this.url = window.location.origin + '/artists/' + this.artist + '/galleries/' + this.gallery + '/pieces/' + this.id
    $.ajax({
      type:'GET',
      dataType: 'json',
      url: this.url,
      context: this
    }).done(function(response){
      this.hearts = response.stars;
      this.gallery = response.gallery_id;
      this.id = response.id;
      this.heart()
      this.update()
      console.log(response);
    }).fail(function(response){
      console.log('this has failed')
    });
  },

  update: function(){
    $.ajax({
      type: 'PUT',
      data: { piece:
        {
          id: this.id,
          gallery_id: this.gallery,
          stars: this.hearts
        }
      },
      dataType: 'json',
      context: this,
      url: window.location.origin + '/artists/' + this.artist + '/galleries/' + this.gallery + '/pieces/' + this.id
    }).done(function(response) {
      console.log("ajax request complete");
      console.log(response);
      console.log(response.stars+ " heartbeats")
      $("#num-of-artbeats").text(response.stars + " heartbeats")
    }).fail(function(response){
      console.log("failed to save", response.responseText);
    })
  }
}
