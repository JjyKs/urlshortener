class ShortenedurlsController < ApplicationController
  #app/models/concerns/random_generator.rb
  include RandomGenerator

  #Jos kerran ainoastaan avoin API kyseessä, niin Postien pitää tulla läpi ulkopuoleltakin
  skip_before_action :verify_authenticity_token


  # GET /shortenedurls
  # GET /shortenedurls.json
  def index
    @shortenedurls = Shortenedurl.all
  end

  # POST /shortenedurls
  def shorten
    #Asetetaan editedParamsiin alkuperäinen parametri, ja random merkkijono
    editedParams = {"original" => params["link"], "shortened" => generateRandomSequence}

    #Jos kohdelinkki on jo olemassa
    if Shortenedurl.exists?(:original => params["link"])
      #Haetaan vanha lyhennys kannasta näkymää varten
      @shortened = Shortenedurl.where(original: params["link"]).first.shortened
    else

      #Jos generoitu merkkijono on jo käytössä luodaan uusi
      while Shortenedurl.exists?(:shortened => editedParams["shortened"]) #Todo, jos generoitu merkkijono löytyy kannasta vaikka 3 kertaa putkeen, niin kasvatetaan pituutta yhdellä
        editedParams["shortened"] = generateRandomSequence
      end

      #Luodaan ja tallennetaan uusi shortenedUrl annettujen tietojen pohjalta, ja asetetaan näkymälle tarvittavat tiedot
      @shortenedurl = Shortenedurl.new(editedParams)
      if @shortenedurl.save
        @shortened = editedParams["shortened"]
      else
        @shortened = "Unknown error occurred"
      end
    end
  end

  def show
    redirectTarget = Shortenedurl.where(shortened: params["id"]).first

    unless redirectTarget.nil?
      byebug
      redirect_to redirectTarget.original.to_s
    else
      raise ActionController::RoutingError.new('Not Found')
    end

  end

  private
  # Sallitaan ainoastaan "link" parametri
  def shortenedurl_params
    params.permit(:link)
  end
end
