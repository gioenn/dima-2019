import React, {Component} from 'react';
import { FlatList, Text, TouchableHighlight, Image, View, StyleSheet } from 'react-native';


export default class MovieList extends Component  {

  render() {
    return (
      <FlatList
        data={this.props.movies}
        renderItem={ (movie) => this.renderItem(movie) }
        keyExtractor= {(movie, index) => {
          return movie.imdbID;
      }} />)
  }

  renderItem(movie){
    return (
      <MovieRow navigate={this.props.navigate} movie={movie.item}/>
    )
  }
}


class MovieRow extends Component {
  _pressRow(){
    console.log("Hello...");
  }
  render() {
    return (
      <TouchableHighlight activeOpacity={0.5}  underlayColor="darkblue" onPress={() => this.props.navigate(this.props.movie)}>
        <View style={styles.container}>
          <Image source={{uri: this.props.movie.Poster}} style={styles.poster}/>
          <View style={[styles.container, styles.description]}>
            <Text style={styles.title}>
                  {this.props.movie.Title}
            </Text>
            <Text style={styles.year}>
                  {this.props.movie.Year}
            </Text>
          </View>
        </View>
        </TouchableHighlight>

    )
  }
}



const styles = StyleSheet.create({
  container: {
    backgroundColor: "white",
    flex: 1,
    padding: 8,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center'
  },
  poster: {
    marginRight: 10,
    height: 250,
    width: 150
  },
  description: {
    flexDirection: 'column',
    alignItems: 'flex-start',
    justifyContent: 'space-between'
  },
  title: {
    color: 'black',
    fontSize: 20,
    fontWeight: "500",
    fontStyle: "italic"
  },
  year: {
    color: 'black',
    fontSize: 16,
    fontWeight: "400",
  }
});
