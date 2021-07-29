import 'package:spotify/spotify.dart';

var clientId = 'f32f690d9c4b4d03bb7916788b7b8ce6';
var clientSecret = 'a8fc5ccda29e4cdbb4a958429444e75e';
Future<SpotifyApi> getSpotifyApi() async {
  final credentials = SpotifyApiCredentials(clientId, clientSecret);
  final grant = SpotifyApi.authorizationCodeGrant(credentials);
  // The URI to redirect to after the user grants or denies permission. It must
  // be in your Spotify application's Redirect URI whitelist. This URI can
  // either be a web address pointing to an authorization server or a fabricated
  // URI that allows the client device to function as an authorization server.
  final redirectUri = 'https://example.com/auth';

  // See https://developer.spotify.com/documentation/general/guides/scopes/
  // for a complete list of these Spotify authorization permissions. If no
  // scopes are specified, only public Spotify information will be available.
  final scopes = ['user-read-email', 'user-library-read'];

  var authUri = grant.getAuthorizationUrl(
    Uri.parse(redirectUri),
    scopes: scopes, // scopes are optional
  );

  // `redirect` is an imaginary function that redirects the resource owner's
  // browser to the `authUri` on the authorization server. Once the resource
  // owner has authorized, they'll be redirected to the `redirectUri` with an
  // authorization code. The exact implementation varies across platforms.
  //await redirect(authUri);

  // `listen` is another imaginary function that listens for a request to
  // `redirectUri` after the user grants or denies permission. Again, the
  // exact implementation varies across platforms.
  if (await canLaunch(authUri)) {
   await launch(authUri);
 }

 ...

 final linksStream = getLinksStream().listen((String link) async {
   if (link.startsWith(redirectUri)) {
     final responseUri = link;
   }
 });

  return SpotifyApi.fromAuthCodeGrant(grant, responseUri);
}
