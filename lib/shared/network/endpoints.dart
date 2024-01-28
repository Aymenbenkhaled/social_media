
// const baseUrl_ = "http://192.168.1.36:3000";
import 'package:socialapp/shared/network/local/cache_helper.dart';

const baseUrl_ = "http://192.168.1.36:4001/api";

const register_ = "auth/register";
const changeEmail_ = "auth/changeEmailRequest";
const verifyOTPChangeEmail_ = "auth/changeEmail";
const verifyOTPForgotPassword_ = "auth/verifyForgetPassword";
const getProduct = "product/getProduct/";

const addCompanyProfile_ =
    "company/createCompanyProfile/bdcb562d-5c24-4afe-b782-5be369817f2c";
//bdcb562d-5c24-4afe-b782-5be369817f2c7
const verifyEmailForgotPassword_ = "auth/forgetPassword";
const forgotPassword_ = "auth/newPassword";

const changePassword_ = "auth/updatePassword";

const verifyOTP_ = "auth/otp-verification";

const addProduct = "product/addProduct";

const LOGIN = 'auth/login';

const updateProfile_ = '/auth/updateProfile';

const HOME = '/home';
const HomeNewArrivages = '/home/new-arrival';
const HomeBestProducts = '/home/best-products';
const HomeSoldProducts = '/home/discounted-products';
const HomeNationalProducts = '/home/national-products';
const HomeNationalProductsBySectorWeb = '/webHome/nationalProductsBySector';
const HomeInterNationalProducts = '/home/international-products';
const HomeInterNationalProductsBySectorWeb =
    '/webHome/internationalProductsBySector';
const HomeStartupsProductsBySectorWeb = '/webHome/startupAlgerianBySector';
const HomeArtisanalProductsBySectorWeb = '/webHome/getProductsArtisanaux';
const getAllCategoriesBySector = '/product/getAllCategoriesBySector';
const getAllSectors = '/product/getAllSectors';
const search_ = '/product/search';

const chats = '/chat/findChats';
const messages = 'chat';
const send_message = 'chat/sendMessage';

const GET_CATEGORIES = 'categories';

const FAVORITES = 'favorites';

const PROFILE = 'profile';

const REGISTER = 'register';

const UPDATE = 'update-profile';

const SEARCH = 'products/search';

const CREATE_CERTIFICATION = 'company/createCertificationCenter/1';

const GET_COUNTRIES_AND_FLAGS = 'https://restcountries.eu/rest/v2/all';

String idUser = CacheHelper.getData(key: 'UserId');

const CREATE_COMPANY_PROFILE = 'company/createCompanyProfile';
const CREATE_COMPANY_STEP = '/company/getCompanyStep';
