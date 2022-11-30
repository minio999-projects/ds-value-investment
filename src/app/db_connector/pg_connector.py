"""
Module for communicating with a postgres db
"""
from functools import wraps
import logging
import psycopg2 # pylint: disable=E0401

def sql_safe_connection(func):
    '''
    Decorator for opening a safe database connection with
    context manager ("with ... as conn:")
    '''
    @wraps(func)
    def wrapper(**kwargs):
        with psycopg2.connect(
                # NOTE: I would never connect database by IP but I don't want to overengineer here
                host = '10.101.225.132',
                port = '5432',
                database = 'postgresdb',
                user='postgres',
                password = 'root'
        ) as conn:

            kwargs['conn'] = kwargs.get('conn', conn)

            try:
                return func(**kwargs)
            except psycopg2.OperationalError as exception:
                logging.warning('PostgreSQL Operational Error: %s', exception)
            except psycopg2.DatabaseError as exception:
                logging.warning('PostgreSQL Database Error: %s', exception)
    return wrapper

class PgConnector():
    '''
    A class with methods on postgres db
    '''
    @staticmethod
    @sql_safe_connection
    def test(conn = None):
        '''
        test
        '''
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM public.company_base_info')
        rows = cursor.fetchall()
        for table in rows:
            print(table)
