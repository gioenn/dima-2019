import MovieListScene from './MovieListScene'
import MovieDetailScene from './MovieDetailScene'
import {createAppContainer } from "react-navigation";
import {createStackNavigator } from "react-navigation-stack";


const AppNavigator = createStackNavigator(
  {
    Home: {screen: MovieListScene},
    Detail: {screen: MovieDetailScene}
  },
  {
    initialRouteName: "Home",
  }
);

export default createAppContainer(AppNavigator);
