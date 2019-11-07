import React from 'react';
import { StyleSheet, View, TextInput } from 'react-native';
import MovieList from './MovieList'
import MovieRest from './MovieRest'

export default class MovieListScene extends React.Component {

  state = { movies: [] };
  rest = new MovieRest();

  static navigationOptions = {
        title: 'Home',
        headerTitleStyle :{textAlign: 'center',alignSelf:'center'},
        headerStyle:{
            backgroundColor:'white',
        },
    };

  render() {
    return (
      <View style={styles.container}>
        <TextInput
          style={styles.input}
          placeholder="Search"
          onChangeText={(text) => {
            this.rest.search(text, (movies) => {
              this.setState({movies: movies})
          })}}
          />
        <MovieList navigate={ (movie) => this.props.navigation.navigate('Detail', { movieId: movie.imdbID, title: movie.Title }) } movies={this.state.movies}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "white"
  },
  input: {
    height: 50,
    margin: 5,
    color: 'black',
    fontSize: 20
  }
});
