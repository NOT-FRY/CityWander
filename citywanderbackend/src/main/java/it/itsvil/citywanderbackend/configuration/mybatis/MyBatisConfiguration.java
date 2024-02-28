package it.itsvil.citywanderbackend.configuration.mybatis;

import it.itsvil.citywanderbackend.mapper.*;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;

@Configuration
public class MyBatisConfiguration {

	public static final String TYPE_ALIASES_PACKAGE = "it.itsvil.citywanderbackend.mapper";
	public static final String CONFIG_FILE_NAME = "mybatis-config.xml";
	public static final String MAPPER_LOCATION_PROVA = "mapper/ProvaMapper.xml";
	public static final String MAPPER_LOCATION_RISTORANTE = "mapper/RistoranteMapper.xml";
	public static final String MAPPER_LOCATION_USER = "mapper/UserMapper.xml";
	public static final String MAPPER_LOCATION_TOUR = "mapper/TourMapper.xml";
	public static final String MAPPER_LOCATION_TAPPA = "mapper/TappaMapper.xml";
	public static final String MAPPER_LOCATION_SEZIONE = "mapper/SezioneMapper.xml";

	public static final String MAPPER_LOCATION_TAPPA_TOUR = "mapper/TappaTourMapper.xml";

	@Value(value = "${spring.datasource.driverClassName}")
	private String dataSourceDriverClassName;

	@Value(value = "${spring.datasource.url}")
	private String dataSourceUrl;

	@Value(value = "${spring.datasource.username}")
	private String dataSourceUsername;

	@Value(value = "${spring.datasource.password}")
	private String dataSourcePassword;

	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(dataSourceDriverClassName);
		dataSource.setUrl(dataSourceUrl);
		dataSource.setUsername(dataSourceUsername);
		dataSource.setPassword(dataSourcePassword);
		return dataSource;
	}


	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(getDataSource());
		transactionManager.setGlobalRollbackOnParticipationFailure(true);
		return transactionManager;
	}

	@Bean
	@Primary
	public SqlSessionFactory sqlSessionFactoryBeanProvaMapper() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getDataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATION_PROVA));
		sqlSessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(CONFIG_FILE_NAME));
		return sqlSessionFactoryBean.getObject();
	}
	@Bean
	public SqlSessionFactory sqlSessionFactoryBeanRistoranteMapper() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getDataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATION_RISTORANTE));
		sqlSessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(CONFIG_FILE_NAME));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionFactory sqlSessionFactoryBeanUserMapper() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getDataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATION_USER));
		sqlSessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(CONFIG_FILE_NAME));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionFactory sqlSessionFactoryBeanTourMapper() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getDataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATION_TOUR));
		sqlSessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(CONFIG_FILE_NAME));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionFactory sqlSessionFactoryBeanTappaMapper() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getDataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATION_TAPPA));
		sqlSessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(CONFIG_FILE_NAME));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionFactory sqlSessionFactoryBeanTappaTourMapper() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getDataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATION_TAPPA_TOUR));
		sqlSessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(CONFIG_FILE_NAME));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionFactory sqlSessionFactoryBeanSezioneMapper() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(getDataSource());
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATION_SEZIONE));
		sqlSessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(CONFIG_FILE_NAME));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public MapperFactoryBean<ProvaMapper> codeableConceptMapper() throws Exception {
		MapperFactoryBean<ProvaMapper> factoryBeanProvaMapper = new MapperFactoryBean<>(ProvaMapper.class);
		factoryBeanProvaMapper.setSqlSessionFactory(sqlSessionFactoryBeanProvaMapper());
		return factoryBeanProvaMapper;
	}

	@Bean
	public MapperFactoryBean<RistoranteMapper> ristoranteMapper() throws Exception {
		MapperFactoryBean<RistoranteMapper> factoryBeanRistoranteMapper = new MapperFactoryBean<>(RistoranteMapper.class);
		factoryBeanRistoranteMapper.setSqlSessionFactory(sqlSessionFactoryBeanRistoranteMapper());
		return factoryBeanRistoranteMapper;
	}

	@Bean
	public MapperFactoryBean<UserMapper> userMapper() throws Exception {
		MapperFactoryBean<UserMapper> factoryBeanUserMapper = new MapperFactoryBean<>(UserMapper.class);
		factoryBeanUserMapper.setSqlSessionFactory(sqlSessionFactoryBeanUserMapper());
		return factoryBeanUserMapper;
	}

	@Bean
	public MapperFactoryBean<TourMapper> tourMapper() throws Exception {
		MapperFactoryBean<TourMapper> factoryBeanTourMapper = new MapperFactoryBean<>(TourMapper.class);
		factoryBeanTourMapper.setSqlSessionFactory(sqlSessionFactoryBeanTourMapper());
		return factoryBeanTourMapper;
	}

	@Bean
	public MapperFactoryBean<TappaMapper> tappaMapper() throws Exception {
		MapperFactoryBean<TappaMapper> factoryBeanTappaMapper = new MapperFactoryBean<>(TappaMapper.class);
		factoryBeanTappaMapper.setSqlSessionFactory(sqlSessionFactoryBeanTappaMapper());
		return factoryBeanTappaMapper;
	}

	@Bean
	public MapperFactoryBean<TappaTourMapper> tappaTourMapper() throws Exception {
		MapperFactoryBean<TappaTourMapper> factoryBeanTappaTourMapper = new MapperFactoryBean<>(TappaTourMapper.class);
		factoryBeanTappaTourMapper.setSqlSessionFactory(sqlSessionFactoryBeanTappaTourMapper());
		return factoryBeanTappaTourMapper;
	}

	@Bean
	public MapperFactoryBean<SezioneMapper> sezioneMapper() throws Exception {
		MapperFactoryBean<SezioneMapper> factoryBeanSezioneMapper = new MapperFactoryBean<>(SezioneMapper.class);
		factoryBeanSezioneMapper.setSqlSessionFactory(sqlSessionFactoryBeanSezioneMapper());
		return factoryBeanSezioneMapper;
	}

	//quando si scrivono gli altri mapper dovete togliere l'annotazione primary
}
