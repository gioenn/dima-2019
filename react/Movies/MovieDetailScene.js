
import React from 'react';
import { StyleSheet, View, Text, Image, ScrollView, SafeAreaView } from 'react-native';
import MovieRest from './MovieRest'

export default class MovieDetailScene extends React.Component {

  state = { movie: [], title: "" };
  rest = new MovieRest();

  static navigationOptions = ({navigation}) => {
        return {
          title: navigation.getParam('title', ''),
          headerTitleStyle :{textAlign: 'center',alignSelf:'center'},
          headerStyle:{
              backgroundColor:'white',
          }
        };
    }

  movieId = this.props.navigation.getParam('movieId', 'null');
  //movieId = "tt0076759";

  componentDidMount(){
    console.log(this.movieId);
    this.rest.find(this.movieId, (movie) => {
      console.log(movie);
      this.setState({movie: movie});
      this.props.navigation.setParams({title: movie.Title})
    });

  }

  render() {
    return (
      <SafeAreaView style={styles.container}>
        <ScrollView style={styles.container}>
          <View style={styles.posterContainer}>
            <Image source={{uri: this.state.movie.Poster}} style={styles.poster}/>
            <View style={styles.ratingContainer}>
              <Image style={styles.star} source={require('./star.png')}/>
              <Text style={styles.rating}> {this.state.movie.imdbRating}</Text>
            </View>
          </View>
          <View style={styles.textContainer}>
            <Text style={styles.textLabel}>Director: </Text>
            <Text style={styles.text}>{this.state.movie.Director}</Text>
          </View>
          <View style={styles.textContainer}>
            <Text style={styles.textLabel}>Runtime: </Text>
            <Text style={styles.text}>{this.state.movie.Runtime}</Text>
          </View>
          <View style={styles.textContainer}>
            <Text style={styles.textLabel}>Year: </Text>
            <Text style={styles.text}>{this.state.movie.Year}</Text>
          </View>
          <View style={styles.textContainer}>
            <Text style={styles.textLabel}>Actors: </Text>
            <Text style={styles.text}>{this.state.movie.Actors}</Text>
          </View>
          <View style={styles.textContainer}>
            <Text style={styles.textLabel}>Plot: </Text>
            <Text style={styles.text}>{this.state.movie.Plot}</Text>
          </View>
        </ScrollView>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    marginRight: 2,
    marginLeft: 2,
  },
  posterContainer: {
    width: "100%",
    alignItems: "center",
    justifyContent: "center",
    marginBottom: 5
  },
  poster: {
    height: 500,
    width: "100%",
    marginBottom: 10
  },
  ratingContainer: {
    alignItems: "center",
    flexDirection: 'row',
  },
  star: {
    width: 40,
    height: 40
  },
  rating: {
    fontSize: 20,
    fontWeight: "600"
  },
  textContainer: {
    width: "100%",
    flexDirection: 'column',
    alignItems: 'flex-start',
  },
  textLabel: {
    fontSize: 18,
    fontWeight: "500"
  },
  text: {
    flex: 1,
    fontSize: 18,
  }

});
