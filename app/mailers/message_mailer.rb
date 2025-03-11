class MessageMailer < ApplicationMailer
    default from: 'jay.ram.celinscak.rom@gmail.com' # Nastavite to na svojo domeno

  def send_message(message)
    @message = message
    @listing = message.listing
    @owner = @listing.user # predpostavljamo, da je lastnik oglasa uporabnik

    mail(to: @owner.email, subject: "Novo sporočilo glede vašega oglasa")
  end
end
