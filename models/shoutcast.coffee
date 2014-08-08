request = require 'superagent'

baseURL = 'http://www.shoutcast.com/'

module.exports.getGenres = ->
  GENRES

module.exports.browseByGenre = (genreName, callback) ->
  url = baseURL + 'Home/BrowseByGenre'

  request
    .post(url)
    .send(genrename: genreName)
    .end (err, res) ->
      callback err, res.body


module.exports.getPlaylist = (stationID, callback) ->
  url = 'http://yp.shoutcast.com/sbin/tunein-station.m3u?id=' + stationID

  request
    .get(url)
    .buffer()
    .end (err, res) ->
      callback err, res.text

module.exports.getStream = (stationID, callback) ->
  url = baseURL + 'Player/GetStreamUrl'
  @currentStationID = stationID
  request
    .post(url)
    .send({ station: stationID })
    .end (err, res) ->
      callback err, res.text

module.exports.getCurrentTrack = (callback) ->
  url = baseURL + 'Player/GetCurrentTrack'

  if @currentStationID
    request
      .post(url)
      .send({ stationID: @currentStationID })
      .end (err, res) ->
        callback err, res.body.Station || {}
  else
    callback null, { stopped: true }




GENRES = ["Alternative","Adult Alternative","Britpop","Classic Alternative","College","Dancepunk","Dream Pop","Emo","Goth","Grunge","Hardcore","Indie Pop","Indie Rock","Industrial","LoFi","Modern Rock","New Wave","Noise Pop","Post Punk","Power Pop","Punk","Ska","Xtreme","Blues","Acoustic Blues","Cajun and Zydeco","Chicago Blues","Contemporary Blues","Country Blues","Delta Blues","Electric Blues","Classical","Baroque","Chamber","Choral","Classical Period","Early Classical","Impressionist","Modern","Opera","Piano","Romantic","Symphony","Country","Alt Country","Americana","Bluegrass","Classic Country","Contemporary Bluegrass","Contemporary Country","Honky Tonk","Hot Country Hits","Western","Decades","00s","30s","40s","50s","60s","70s","80s","90s","Easy Listening","Exotica","Light Rock","Lounge","Orchestral Pop","Polka","Space Age Pop","Electronic","Acid House","Ambient","Big Beat","Breakbeat","Dance","Demo","Disco","Downtempo","Drum and Bass","Dubstep","Electro","Garage","Hard House","House","IDM","Jungle","Progressive","Techno","Trance","Tribal","Trip Hop","Folk","Alternative Folk","Contemporary Folk","Folk Rock","New Acoustic","Old Time","Traditional Folk","World Folk","Inspirational","Christian","Christian Metal","Christian Rap","Christian Rock","Classic Christian","Contemporary Gospel","Gospel","Praise and Worship","Sermons and Services","Southern Gospel","Traditional Gospel","International","African","Afrikaans","Arabic","Asian","Bollywood","Brazilian","Caribbean","Celtic","Chinese","Creole","European","Filipino","French","German","Greek","Hawaiian and Pacific","Hebrew","Hindi","Indian","Islamic","Japanese","Klezmer","Korean","Mediterranean","Middle Eastern","North American","Russian","Soca","South American","Tamil","Turkish","Worldbeat","Zouk","Jazz","Acid Jazz","Avant Garde","Big Band","Bop","Classic Jazz","Cool Jazz","Fusion","Hard Bop","Latin Jazz","Smooth Jazz","Swing","Vocal Jazz","World Fusion","Latin","Bachata","Banda","Bossa Nova","Cumbia","Flamenco","Latin Dance","Latin Pop","Latin Rap and Hip Hop","Latin Rock","Mariachi","Merengue","Ranchera","Reggaeton","Regional Mexican","Salsa","Samba","Tango","Tejano","Tropicalia","Metal","Black Metal","Classic Metal","Death Metal","Extreme Metal","Grindcore","Hair Metal","Heavy Metal","Metalcore","Power Metal","Progressive Metal","Rap Metal","Thrash Metal","Misc","New Age","Environmental","Ethnic Fusion","Healing","Meditation","Spiritual","Pop","Adult Contemporary","Barbershop","Bubblegum Pop","Dance Pop","Idols","JPOP","KPOP","Oldies","Soft Rock","Teen Pop","Top 40","World Pop","Public Radio","News","Sports","Talk","Weather","R&B and Urban","Classic R&B","Contemporary R&B","Doo Wop","Funk","Motown","Neo Soul","Quiet Storm","Soul","Urban Contemporary","Rap","Alternative Rap","Dirty South","East Coast Rap","Freestyle","Gangsta Rap","Hip Hop","Mixtapes","Old School","Turntablism","Underground Hip Hop","West Coast Rap","Reggae","Contemporary Reggae","Dancehall","Dub","Pop Reggae","Ragga","Reggae Roots","Rock Steady","Rock","Adult Album Alternative","British Invasion","Celtic Rock","Classic Rock","Garage Rock","Glam","Hard Rock","Jam Bands","JROCK","Piano Rock","Prog Rock","Psychedelic","Rock & Roll","Rockabilly","Singer and Songwriter","Surf","Seasonal and Holiday","Anniversary","Birthday","Christmas","Halloween","Hanukkah","Honeymoon","Kwanzaa","Valentine","Wedding","Winter","Soundtracks","Anime","Kids","Original Score","Showtunes","Video Game Music","BlogTalk","Comedy","Community","Educational","Government","Old Time Radio","Other Talk","Political","Scanner","Spoken Word","Technology","Themes","Adult","Best Of","Chill","Eclectic","Experimental","Female","Heartache","Instrumental","LGBT","Love and Romance","Party Mix","Patriotic","Rainy Day Mix","Reality","Sexy","Shuffle","Travel Mix","Tribute","Trippy","Work Mix"]